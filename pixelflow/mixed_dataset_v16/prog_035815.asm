; DESCRIPTION: Places a green 26x109 box at position (119, 179).
; PLAN: r0=119(x), r1=179(y), r2=26(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 179
LDI r2, 26
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
