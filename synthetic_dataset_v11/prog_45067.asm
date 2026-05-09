; DESCRIPTION: Places a green 81x93 rectangle at position (35, 147).
; PLAN: r0=35(x), r1=147(y), r2=81(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 147
LDI r2, 81
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
