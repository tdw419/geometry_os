; DESCRIPTION: Renders a blue box of size 63x18 starting at (104, 14).
; PLAN: r0=104(x), r1=14(y), r2=63(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 14
LDI r2, 63
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
