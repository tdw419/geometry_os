; DESCRIPTION: Composite: . Then Places a red line segment connecting (227, 132) to (129, 51). Then Places a orange dot at position (218, 7).
; PLAN: r0=227(x1), r1=132(y1), r2=129(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=218(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (227, 132) to (129, 51).
; PLAN: r0=227(x1), r1=132(y1), r2=129(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 132
LDI r2, 129
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (218, 7).
; PLAN: r0=218(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
