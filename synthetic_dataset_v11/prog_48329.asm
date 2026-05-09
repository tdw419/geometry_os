; DESCRIPTION: Places a blue 66x78 rectangle at position (12, 129).
; PLAN: r0=12(x), r1=129(y), r2=66(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 129
LDI r2, 66
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
