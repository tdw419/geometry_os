; DESCRIPTION: Places a green 110x65 rectangle at position (64, 118).
; PLAN: r0=64(x), r1=118(y), r2=110(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 118
LDI r2, 110
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
