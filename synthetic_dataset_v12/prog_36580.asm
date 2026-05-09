; DESCRIPTION: Renders a black box of size 79x55 starting at (217, 7).
; PLAN: r0=217(x), r1=7(y), r2=79(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 7
LDI r2, 79
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
