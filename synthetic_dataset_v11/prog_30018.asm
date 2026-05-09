; DESCRIPTION: Composite: . Then Renders a orange line between points (225, 102) and (99, 232). Then Places a white dot at position (159, 26).
; PLAN: r0=225(x1), r1=102(y1), r2=99(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (225, 102) and (99, 232).
; PLAN: r0=225(x1), r1=102(y1), r2=99(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 102
LDI r2, 99
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (159, 26).
; PLAN: r0=159(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 26
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
