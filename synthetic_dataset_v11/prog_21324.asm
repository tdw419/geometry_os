; DESCRIPTION: Places a green 31x101 rectangle at position (144, 94).
; PLAN: r0=144(x), r1=94(y), r2=31(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 94
LDI r2, 31
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
