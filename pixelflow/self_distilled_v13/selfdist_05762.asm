; DESCRIPTION: Places a cyan 97x108 box at position (31, 100).
; PLAN: r0=31(x), r1=100(y), r2=97(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 100
LDI r2, 97
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
