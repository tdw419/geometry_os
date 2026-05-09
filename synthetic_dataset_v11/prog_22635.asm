; DESCRIPTION: Renders a blue box of size 80x68 starting at (106, 32).
; PLAN: r0=106(x), r1=32(y), r2=80(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 32
LDI r2, 80
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
