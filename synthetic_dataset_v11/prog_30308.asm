; DESCRIPTION: Renders a black box of size 75x60 starting at (124, 79).
; PLAN: r0=124(x), r1=79(y), r2=75(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 79
LDI r2, 75
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
