; DESCRIPTION: Composite: . Then Draws a red line from (111, 171) to (203, 17). Then Sets a single white pixel at (229, 77).
; PLAN: r0=111(x1), r1=171(y1), r2=203(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=229(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (111, 171) to (203, 17).
; PLAN: r0=111(x1), r1=171(y1), r2=203(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 171
LDI r2, 203
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (229, 77).
; PLAN: r0=229(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
