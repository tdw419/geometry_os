; DESCRIPTION: Renders a black box of size 79x66 starting at (271, 55).
; PLAN: r0=271(x), r1=55(y), r2=79(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 55
LDI r2, 79
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
