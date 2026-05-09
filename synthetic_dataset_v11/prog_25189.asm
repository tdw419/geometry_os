; DESCRIPTION: Composite: . Then Renders a yellow line between points (251, 205) and (229, 156). Then Places a purple dot at position (81, 34).
; PLAN: r0=251(x1), r1=205(y1), r2=229(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=81(x), r1=34(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (251, 205) and (229, 156).
; PLAN: r0=251(x1), r1=205(y1), r2=229(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 205
LDI r2, 229
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (81, 34).
; PLAN: r0=81(x), r1=34(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 34
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
