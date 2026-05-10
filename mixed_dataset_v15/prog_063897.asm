; DESCRIPTION: Places a green 97x75 rectangle at position (328, 35).
; PLAN: r0=328(x), r1=35(y), r2=97(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 35
LDI r2, 97
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
