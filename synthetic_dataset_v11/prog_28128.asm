; DESCRIPTION: Composite: . Then Places a orange dot at position (99, 145). Then Renders a yellow line between points (183, 198) and (231, 51).
; PLAN: r0=99(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=183(x1), r1=198(y1), r2=231(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (99, 145).
; PLAN: r0=99(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 145
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (183, 198) and (231, 51).
; PLAN: r0=183(x1), r1=198(y1), r2=231(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 198
LDI r2, 231
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
