; DESCRIPTION: Composite: . Then Renders a orange line between points (8, 13) and (35, 223). Then Places a orange dot at position (99, 140).
; PLAN: r0=8(x1), r1=13(y1), r2=35(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=99(x), r1=140(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (8, 13) and (35, 223).
; PLAN: r0=8(x1), r1=13(y1), r2=35(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 13
LDI r2, 35
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (99, 140).
; PLAN: r0=99(x), r1=140(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 140
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
