; Simple XOR Circuit Test - Demonstrates Geometric Intelligence Loop
; 1. Load XOR spatial circuit onto GPU substrate
; 2. Configure inputs via MMIO
; 3. Fire circuit and read result
; 4. Validate with VCC (Visual Contract Check)

; Substrate MMIO Base (using 0xE000 range for VM substrate commands)
#define SUBSTRATE_CMD  0xE004
#define SUBSTRATE_ARG1 0xE008
#define SUBSTRATE_ARG2 0xE00C
#define SUBSTRATE_STATUS 0xE010
#define SUBSTRATE_RESULT 0xE014

; Commands
#define CMD_CIRCUIT_LOAD  0x02
#define CMD_CIRCUIT_WRITE 0x03
#define CMD_CIRCUIT_READ  0x04
#define CMD_CIRCUIT_FIRE  0x05

; Circuit IDs
#define CIRCUIT_XOR 2

; Status codes
#define STATUS_DONE 0x02

; Ports
#define PORT_A 0  ; Input A
#define PORT_B 1  ; Input B (also used for output)
#define PORT_OUT 1 ; Output port

; Initialize display
LDI r0, 0x001133
FILL r0

LDI r0, 0x00FFFFFF
LDI r1, 10
LDI r2, 10
TEXT r0, r1, r2, "Geometric Intelligence Test"

; STEP 1: Load XOR Circuit
LDI r0, 0x0044FF44
LDI r1, 20
LDI r2, 30
TEXT r0, r1, r2, "Step 1: Loading XOR Circuit..."

; Issue CIRCUIT_LOAD command for XOR (id=2)
LDI r10, CMD_CIRCUIT_LOAD
STO [SUBSTRATE_CMD], r10

LDI r10, CIRCUIT_XOR
STO [SUBSTRATE_ARG1], r10

; Wait for completion
wait_load:
LDO r10, [SUBSTRATE_STATUS]
CMPI r10, STATUS_DONE
JNZ r0, wait_load

LDI r0, 0x0044FF44
LDI r1, 20
LDI r2, 40
TEXT r0, r1, r2, "Circuit Loaded!"

; STEP 2: Test Case - 1 XOR 0 = 1
LDI r0, 0x00FFFFFF
LDI r1, 20
LDI r2, 50
TEXT r0, r1, r2, "Step 2: Testing 1 XOR 0..."

; Write input A = 1
LDI r10, PORT_A
LDI r11, 1
STO [SUBSTRATE_ARG1], r10
STO [SUBSTRATE_ARG2], r11
LDI r12, CMD_CIRCUIT_WRITE
STO [SUBSTRATE_CMD], r12

wait_write:
LDO r10, [SUBSTRATE_STATUS]
CMPI r10, STATUS_DONE
JNZ r0, wait_write

; Fire circuit
LDI r10, CMD_CIRCUIT_FIRE
STO [SUBSTRATE_CMD], r10

wait_fire:
LDO r10, [SUBSTRATE_STATUS]
CMPI r10, STATUS_DONE
JNZ r0, wait_fire

; Read result from port 1
LDI r10, PORT_OUT
STO [SUBSTRATE_ARG1], r10
LDI r12, CMD_CIRCUIT_READ
STO [SUBSTRATE_CMD], r12

wait_read:
LDO r10, [SUBSTRATE_STATUS]
CMPI r10, STATUS_DONE
JNZ r0, wait_read

; Get result
LDO r30, [SUBSTRATE_RESULT]

; Display result
LDI r0, 0x00FFFFFF
LDI r1, 20
LDI r2, 60
TEXT r0, r1, r2, "Result: "

LDI r1, 80
CMPI r30, 1
JZ r0, result_pass
LDI r0, 0x00FF4444
LDI r2, 80
TEXT r0, r1, r2, "FAIL (expected 1)"
JMP done
result_pass:
LDI r0, 0x0044FF44
LDI r2, 80
TEXT r0, r1, r2, "PASS!"

done:
; Display completion
LDI r0, 0x00FFFF88
LDI r1, 20
LDI r2, 80
TEXT r0, r1, r2, "Geometric Intelligence Loop Complete!"

HALT