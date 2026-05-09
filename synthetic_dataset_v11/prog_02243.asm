; DESCRIPTION: Renders a blue box of size 68x110 starting at (117, 15).
; PLAN: r0=117(x), r1=15(y), r2=68(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 15
LDI r2, 68
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
