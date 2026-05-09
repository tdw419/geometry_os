; DESCRIPTION: Composite: . Then Sets a single orange pixel at (232, 34). Then Renders a magenta line between points (107, 75) and (101, 41).
; PLAN: r0=232(x), r1=34(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=107(x1), r1=75(y1), r2=101(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (232, 34).
; PLAN: r0=232(x), r1=34(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 34
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta line between points (107, 75) and (101, 41).
; PLAN: r0=107(x1), r1=75(y1), r2=101(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 75
LDI r2, 101
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
