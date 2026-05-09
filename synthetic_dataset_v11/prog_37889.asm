; DESCRIPTION: Composite: . Then Renders a yellow line between points (181, 35) and (79, 21). Then Sets a single yellow pixel at (25, 194).
; PLAN: r0=181(x1), r1=35(y1), r2=79(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=25(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (181, 35) and (79, 21).
; PLAN: r0=181(x1), r1=35(y1), r2=79(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 35
LDI r2, 79
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (25, 194).
; PLAN: r0=25(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 194
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
