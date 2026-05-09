; DESCRIPTION: Renders a blue box of size 117x101 starting at (198, 17).
; PLAN: r0=198(x), r1=17(y), r2=117(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 17
LDI r2, 117
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
