; DESCRIPTION: Composite: . Then Draws a black line from (190, 253) to (65, 123). Then Sets a single black pixel at (125, 72).
; PLAN: r0=190(x1), r1=253(y1), r2=65(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=125(x), r1=72(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (190, 253) to (65, 123).
; PLAN: r0=190(x1), r1=253(y1), r2=65(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 253
LDI r2, 65
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (125, 72).
; PLAN: r0=125(x), r1=72(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 72
LDI r2, 0x000000
PSET r0, r1, r2
HALT
