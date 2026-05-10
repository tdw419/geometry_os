; DESCRIPTION: Places a green 99x12 box at position (159, 156).
; PLAN: r0=159(x), r1=156(y), r2=99(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 156
LDI r2, 99
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
