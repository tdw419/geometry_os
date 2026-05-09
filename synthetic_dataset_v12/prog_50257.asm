; DESCRIPTION: Renders a blue box of size 22x80 starting at (54, 126).
; PLAN: r0=54(x), r1=126(y), r2=22(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 126
LDI r2, 22
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
