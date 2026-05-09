; DESCRIPTION: Composite: . Then Sets a single white pixel at (147, 22). Then Renders a red line between points (232, 194) and (134, 212).
; PLAN: r0=147(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=232(x1), r1=194(y1), r2=134(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (147, 22).
; PLAN: r0=147(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 22
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (232, 194) and (134, 212).
; PLAN: r0=232(x1), r1=194(y1), r2=134(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 194
LDI r2, 134
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
