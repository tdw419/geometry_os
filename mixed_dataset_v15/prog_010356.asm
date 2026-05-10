; DESCRIPTION: Places a blue 34x94 rectangle at position (478, 148).
; PLAN: r0=478(x), r1=148(y), r2=34(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 148
LDI r2, 34
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
