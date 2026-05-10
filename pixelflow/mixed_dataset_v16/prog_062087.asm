; DESCRIPTION: Places a green 19x119 box at position (13, 190).
; PLAN: r0=13(x), r1=190(y), r2=19(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 190
LDI r2, 19
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
