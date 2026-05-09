; DESCRIPTION: Renders a blue box of size 26x70 starting at (476, 186).
; PLAN: r0=476(x), r1=186(y), r2=26(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 186
LDI r2, 26
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
