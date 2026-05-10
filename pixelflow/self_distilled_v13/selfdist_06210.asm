; DESCRIPTION: Places a cyan 89x114 box at position (79, 17).
; PLAN: r0=79(x), r1=17(y), r2=89(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 17
LDI r2, 89
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
