; DESCRIPTION: Places a green 12x101 box at position (174, 90).
; PLAN: r0=174(x), r1=90(y), r2=12(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 90
LDI r2, 12
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
