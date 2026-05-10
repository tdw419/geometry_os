; DESCRIPTION: Places a green 16x109 box at position (194, 63).
; PLAN: r0=194(x), r1=63(y), r2=16(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 63
LDI r2, 16
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
