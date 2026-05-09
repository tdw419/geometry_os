; DESCRIPTION: Renders a blue box of size 101x25 starting at (54, 206).
; PLAN: r0=54(x), r1=206(y), r2=101(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 206
LDI r2, 101
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
