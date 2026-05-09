; DESCRIPTION: Places a green 91x94 rectangle at position (259, 32).
; PLAN: r0=259(x), r1=32(y), r2=91(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 32
LDI r2, 91
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
