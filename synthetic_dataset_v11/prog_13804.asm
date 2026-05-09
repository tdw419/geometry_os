; DESCRIPTION: Places a blue 71x40 rectangle at position (155, 148).
; PLAN: r0=155(x), r1=148(y), r2=71(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 148
LDI r2, 71
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
