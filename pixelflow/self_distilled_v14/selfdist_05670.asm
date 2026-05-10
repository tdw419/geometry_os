; DESCRIPTION: Places a green 26x26 box at position (210, 12).
; PLAN: r0=210(x), r1=12(y), r2=26(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 12
LDI r2, 26
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
