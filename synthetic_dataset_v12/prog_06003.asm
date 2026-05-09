; DESCRIPTION: Renders a blue box of size 19x25 starting at (123, 158).
; PLAN: r0=123(x), r1=158(y), r2=19(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 158
LDI r2, 19
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
