; DESCRIPTION: Places a orange 80x91 box at position (319, 145).
; PLAN: r0=319(x), r1=145(y), r2=80(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 145
LDI r2, 80
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
