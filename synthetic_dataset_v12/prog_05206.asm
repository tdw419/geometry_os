; DESCRIPTION: Places a green 18x110 rectangle at position (371, 99).
; PLAN: r0=371(x), r1=99(y), r2=18(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 99
LDI r2, 18
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
