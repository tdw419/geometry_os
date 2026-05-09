; DESCRIPTION: Renders a blue box of size 115x99 starting at (23, 104).
; PLAN: r0=23(x), r1=104(y), r2=115(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 104
LDI r2, 115
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
