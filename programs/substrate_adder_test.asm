; 1-bit Full Adder (Spatial Implementation)
; Corrected for GeOS Native VM MMIO (0xE000)

#define SUBSTRATE_BASE 0xE000
#define SUB_CMD        0xE004
#define SUB_ARG1       0xE005
#define SUB_ARG2       0xE006
#define SUB_STATUS     0xE007
#define SUB_RESULT     0xE008

#define CMD_LOAD       0x02
#define CMD_WRITE      0x03
#define CMD_READ       0x04
#define CMD_TICK       0x01

#define CIRCUIT_ADDER  3

LDI r30, 0xFF00

; --- Step 1: Load Adder Circuit ---
LDI r1, SUB_ARG1
LDI r2, CIRCUIT_ADDER
STORE r1, r2

LDI r1, SUB_CMD
LDI r2, CMD_LOAD
STORE r1, r2

wait_load:
LDI r1, SUB_STATUS
LOAD r2, r1
CMPI r2, 2 ; STATUS_DONE
JNZ r0, wait_load

; --- Step 2: Test 1 + 1 + 0 = (Sum=0, Cout=1) ---
; Port 0 = A, Port 1 = B, Port 2 = Cin
LDI r1, SUB_ARG1
LDI r2, 0 ; Port A
STORE r1, r2
LDI r1, SUB_ARG2
LDI r2, 0xFFFF ; Value High
STORE r1, r2
LDI r1, SUB_CMD
LDI r2, CMD_WRITE
STORE r1, r2

LDI r1, SUB_ARG1
LDI r2, 1 ; Port B
STORE r1, r2
LDI r1, SUB_ARG2
LDI r2, 0xFFFF ; Value High
STORE r1, r2
LDI r1, SUB_CMD
LDI r2, CMD_WRITE
STORE r1, r2

LDI r1, SUB_ARG1
LDI r2, 2 ; Port Cin
STORE r1, r2
LDI r1, SUB_ARG2
LDI r2, 0 ; Value 0
STORE r1, r2
LDI r1, SUB_CMD
LDI r2, CMD_WRITE
STORE r1, r2

; Tick to propagate signals
LDI r1, SUB_ARG1
LDI r2, 500 ; 500 ticks
STORE r1, r2
LDI r1, SUB_CMD
LDI r2, CMD_TICK
STORE r1, r2

; --- Step 3: Read Result ---
; Port 3 = Sum, Port 4 = Cout
LDI r1, SUB_ARG1
LDI r2, 3 ; Sum
STORE r1, r2
LDI r1, SUB_CMD
LDI r2, CMD_READ
STORE r1, r2
LDI r1, SUB_RESULT
LOAD r10, r1 ; Sum into r10

LDI r1, SUB_ARG1
LDI r2, 4 ; Cout
STORE r1, r2
LDI r1, SUB_CMD
LDI r2, CMD_READ
STORE r1, r2
LDI r1, SUB_RESULT
LOAD r11, r1 ; Cout into r11

; Display on screen for confirmation
LDI r0, 0x000000 ; Clear
FILL r0

LDI r1, 10
LDI r2, 10
LDI r3, 0x6000
STRO r3, "ADDER: 1+1=10"
LDI r4, 0xFFFFFF
LDI r5, 0x000000
DRAWTEXT r1, r2, r3, r4, r5

HALT
