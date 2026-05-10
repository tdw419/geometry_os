; DESCRIPTION: Places a yellow 100x97 box at position (283, 160).
; PLAN: r0=283(x), r1=160(y), r2=100(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 160
LDI r2, 100
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
