; DESCRIPTION: Places a blue 114x81 rectangle at position (24, 129).
; PLAN: r0=24(x), r1=129(y), r2=114(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 129
LDI r2, 114
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
