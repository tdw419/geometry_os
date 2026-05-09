; DESCRIPTION: Places a green 23x49 rectangle at position (323, 81).
; PLAN: r0=323(x), r1=81(y), r2=23(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 81
LDI r2, 23
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
