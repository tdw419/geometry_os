; DESCRIPTION: Places a green 53x118 rectangle at position (431, 129).
; PLAN: r0=431(x), r1=129(y), r2=53(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 129
LDI r2, 53
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
