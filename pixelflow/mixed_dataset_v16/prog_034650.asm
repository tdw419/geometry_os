; DESCRIPTION: Renders a black box of size 28x79 starting at (277, 73).
; PLAN: r0=277(x), r1=73(y), r2=28(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 73
LDI r2, 28
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
