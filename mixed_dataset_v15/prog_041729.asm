; DESCRIPTION: Places a green 26x31 box at position (11, 89).
; PLAN: r0=11(x), r1=89(y), r2=26(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 89
LDI r2, 26
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
