; DESCRIPTION: Renders a white box of size 63x104 starting at (52, 22).
; PLAN: r0=52(x), r1=22(y), r2=63(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 22
LDI r2, 63
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
