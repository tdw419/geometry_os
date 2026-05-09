; DESCRIPTION: Places a cyan 80x13 rectangle at position (110, 232).
; PLAN: r0=110(x), r1=232(y), r2=80(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 232
LDI r2, 80
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
