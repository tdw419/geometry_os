; DESCRIPTION: Composite: . Then Places a white dot at position (138, 129). Then Renders a orange line between points (15, 233) and (111, 26).
; PLAN: r0=138(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=15(x1), r1=233(y1), r2=111(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (138, 129).
; PLAN: r0=138(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (15, 233) and (111, 26).
; PLAN: r0=15(x1), r1=233(y1), r2=111(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 233
LDI r2, 111
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
