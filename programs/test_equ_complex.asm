; Test .equ and .set directives with constant references
.equ BASE_ADDR 0x2000
.set OFFSET 10
.equ FINAL_ADDR BASE_ADDR + OFFSET

LDI r0, BASE_ADDR
ADDI r0, OFFSET
CMP r0, FINAL_ADDR
HALT