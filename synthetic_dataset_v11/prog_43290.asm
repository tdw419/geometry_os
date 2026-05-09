; DESCRIPTION: Places a green 60x114 rectangle at position (13, 114).
; PLAN: r0=13(x), r1=114(y), r2=60(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 114
LDI r2, 60
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
