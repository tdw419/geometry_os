; DESCRIPTION: Places a cyan 77x63 box at position (272, 104).
; PLAN: r0=272(x), r1=104(y), r2=77(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 104
LDI r2, 77
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
