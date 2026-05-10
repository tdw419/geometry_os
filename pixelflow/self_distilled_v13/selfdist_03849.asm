; DESCRIPTION: Places a green 31x37 box at position (251, 178).
; PLAN: r0=251(x), r1=178(y), r2=31(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 178
LDI r2, 31
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
