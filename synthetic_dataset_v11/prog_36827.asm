; DESCRIPTION: Places a blue 67x34 rectangle at position (147, 181).
; PLAN: r0=147(x), r1=181(y), r2=67(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 181
LDI r2, 67
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
