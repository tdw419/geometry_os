; DESCRIPTION: Places a cyan 86x80 rectangle at position (166, 110).
; PLAN: r0=166(x), r1=110(y), r2=86(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 110
LDI r2, 86
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
