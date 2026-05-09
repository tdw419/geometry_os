; DESCRIPTION: Places a green 12x101 rectangle at position (390, 139).
; PLAN: r0=390(x), r1=139(y), r2=12(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 139
LDI r2, 12
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
