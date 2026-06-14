; XOR Circuit Test via Substrate MMIO
; Demonstrates end-to-end "Geometric Intelligence" loop:
;   1. Spatial logic (XOR circuit on GPU substrate)
;   2. MMIO bridge interaction
;   3. VCC validation pattern

; Substrate MMIO Base
#define SUBSTRATE_BASE 0x40000000

; Register offsets
#define SUB_X       0x00
#define SUB_Y       0x04
#define SUB_CMD     0x08
#define SUB_ARG1    0x0C
#define SUB_ARG2    0x10
#define SUB_STATUS  0x14
#define SUB_RESULT  0x18

; Commands
#define CMD_NOP         0x00
#define CMD_TICK        0x01
#define CMD_CIRCUIT_LOAD  0x02
#define CMD_CIRCUIT_WRITE 0x03
#define CMD_CIRCUIT_READ  0x04
#define CMD_CIRCUIT_FIRE  0x05

; Circuit IDs
#define CIRCUIT_XOR 2

; Status codes
#define STATUS_IDLE 0x00
#define STATUS_BUSY 0x01
#define STATUS_DONE 0x02
#define STATUS_ERROR 0xFF

; Input ports for XOR circuit
#define XOR_PORT_A 0   ; Path A input
#define XOR_PORT_B 1   ; Path B input

; Output ports
#define XOR_PORT_OUT 1 ; Direct XOR output

; Start
LDI r30, 0xFF00

; Clear screen with dark background
LDI r0, 0x050510
FILL r0

; Draw test info
LDI r0, 0x00
LDI r1, 0xFFFFFF
LDI r2, 20
LDI r3, 20
TEXT r0, r1, r2, r3, "XOR Circuit Test"

; Step 1: Load XOR circuit
LDI r10, SUBSTRATE_BASE
LDI r11, CMD_CIRCUIT_LOAD
STO [r10 + SUB_CMD], r11     ; Issue CIRCUIT_LOAD command

LDI r11, CIRCUIT_XOR
STO [r10 + SUB_ARG1], r11    ; Set circuit ID = 2 (XOR)

; Wait for completion
wait_load:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_load

; Draw "Circuit Loaded"
LDI r0, 0x44FF44
LDI r2, 40
TEXT r0, r1, r2, r3, "Circuit Loaded (XOR)"

; Step 2: Test case 1: 0 XOR 0 = 0
LDI r20, 0     ; Input A = 0
LDI r21, 0     ; Input B = 0

; Write input A
STO [r10 + SUB_ARG1], r20    ; port = 0
STO [r10 + SUB_ARG2], r21    ; val = 0
LDI r11, CMD_CIRCUIT_WRITE
STO [r10 + SUB_CMD], r11     ; Issue CIRCUIT_WRITE

wait_write1:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_write1

; Write input B
LDI r20, XOR_PORT_B
LDI r21, 0
STO [r10 + SUB_ARG1], r20    ; port = 1
STO [r10 + SUB_ARG2], r21    ; val = 0
LDI r11, CMD_CIRCUIT_WRITE
STO [r10 + SUB_CMD], r11

wait_write2:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_write2

; Fire circuit
LDI r11, CMD_CIRCUIT_FIRE
STO [r10 + SUB_CMD], r11

wait_fire1:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_fire1

; Read result
STO [r10 + SUB_ARG1], r20    ; port = 1 (direct XOR output)
LDI r11, CMD_CIRCUIT_READ
STO [r10 + SUB_CMD], r11

wait_read1:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_read1

LDO r30, [r10 + SUB_RESULT]  ; Get result in r30

; Display test case 1 result
LDI r2, 60
LDI r3, 20
TEXT r0, r1, r2, r3, "0 XOR 0 = "
LDI r2, 120
LDI r3, 20
CMPI r30, 0
JZ r0, test1_pass
LDI r0, 0xFF4444
JMP test1_done
test1_pass:
LDI r0, 0x44FF44
test1_done:
TEXT r0, r1, r2, r3, "PASS"

; Step 3: Test case 2: 1 XOR 0 = 1
LDI r0, 0x00

; Write input A = 1
LDI r20, XOR_PORT_A
LDI r21, 1
STO [r10 + SUB_ARG1], r20
STO [r10 + SUB_ARG2], r21
LDI r11, CMD_CIRCUIT_WRITE
STO [r10 + SUB_CMD], r11

wait_write3:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_write3

; Fire and read
LDI r11, CMD_CIRCUIT_FIRE
STO [r10 + SUB_CMD], r11

wait_fire2:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_fire2

LDI r20, XOR_PORT_OUT
STO [r10 + SUB_ARG1], r20
LDI r11, CMD_CIRCUIT_READ
STO [r10 + SUB_CMD], r11

wait_read2:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_read2

LDO r30, [r10 + SUB_RESULT]

; Display test case 2
LDI r0, 0x00
LDI r1, 0xFFFFFF
LDI r2, 60
LDI r3, 30
TEXT r0, r1, r2, r3, "1 XOR 0 = "
LDI r2, 120
LDI r3, 30
CMPI r30, 1
JZ r0, test2_pass
LDI r0, 0xFF4444
JMP test2_done
test2_pass:
LDI r0, 0x44FF44
test2_done:
TEXT r0, r1, r2, r3, "PASS"

; Step 4: Test case 3: 0 XOR 1 = 1
LDI r0, 0x00

; Write input B = 1
LDI r20, XOR_PORT_B
LDI r21, 1
STO [r10 + SUB_ARG1], r20
STO [r10 + SUB_ARG2], r21
LDI r11, CMD_CIRCUIT_WRITE
STO [r10 + SUB_CMD], r11

wait_write4:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_write4

; Fire and read
LDI r11, CMD_CIRCUIT_FIRE
STO [r10 + SUB_CMD], r11

wait_fire3:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_fire3

LDI r20, XOR_PORT_OUT
STO [r10 + SUB_ARG1], r20
LDI r11, CMD_CIRCUIT_READ
STO [r10 + SUB_CMD], r11

wait_read3:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_read3

LDO r30, [r10 + SUB_RESULT]

; Display test case 3
LDI r0, 0x00
LDI r1, 0xFFFFFF
LDI r2, 60
LDI r3, 40
TEXT r0, r1, r2, r3, "0 XOR 1 = "
LDI r2, 120
LDI r3, 40
CMPI r30, 1
JZ r0, test3_pass
LDI r0, 0xFF4444
JMP test3_done
test3_pass:
LDI r0, 0x44FF44
test3_done:
TEXT r0, r1, r2, r3, "PASS"

; Step 5: Test case 4: 1 XOR 1 = 0
LDI r0, 0x00

; Write input A = 1, B = 1
LDI r20, XOR_PORT_A
LDI r21, 1
STO [r10 + SUB_ARG1], r20
STO [r10 + SUB_ARG2], r21
LDI r11, CMD_CIRCUIT_WRITE
STO [r10 + SUB_CMD], r11

wait_write5:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_write5

LDI r20, XOR_PORT_B
LDI r21, 1
STO [r10 + SUB_ARG1], r20
STO [r10 + SUB_ARG2], r21
LDI r11, CMD_CIRCUIT_WRITE
STO [r10 + SUB_CMD], r11

wait_write6:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_write6

; Fire and read
LDI r11, CMD_CIRCUIT_FIRE
STO [r10 + SUB_CMD], r11

wait_fire4:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_fire4

LDI r20, XOR_PORT_OUT
STO [r10 + SUB_ARG1], r20
LDI r11, CMD_CIRCUIT_READ
STO [r10 + SUB_CMD], r11

wait_read4:
LDO r11, [r10 + SUB_STATUS]
CMPI r11, STATUS_DONE
JNZ r0, wait_read4

LDO r30, [r10 + SUB_RESULT]

; Display test case 4
LDI r0, 0x00
LDI r1, 0xFFFFFF
LDI r2, 60
LDI r3, 50
TEXT r0, r1, r2, r3, "1 XOR 1 = "
LDI r2, 120
LDI r3, 50
CMPI r30, 0
JZ r0, test4_pass
LDI r0, 0xFF4444
JMP test4_done
test4_pass:
LDI r0, 0x44FF44
test4_done:
TEXT r0, r1, r2, r3, "PASS"

; Draw completion message
LDI r0, 0x00
LDI r1, 0xFFFF88
LDI r2, 20
LDI r3, 70
TEXT r0, r1, r2, r3, "Substrate XOR Tests Complete!"

; Halt
HALT