; DESCRIPTION: Composite: . Then Sets a single red pixel at (159, 146). Then Draws a red line from (30, 19) to (159, 234).
; PLAN: r0=159(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=30(x1), r1=19(y1), r2=159(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (159, 146).
; PLAN: r0=159(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 146
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (30, 19) to (159, 234).
; PLAN: r0=30(x1), r1=19(y1), r2=159(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 19
LDI r2, 159
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
