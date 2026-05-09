; DESCRIPTION: Composite: . Then Sets a single white pixel at (100, 127). Then Renders a white line between points (186, 203) and (198, 106).
; PLAN: r0=100(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=186(x1), r1=203(y1), r2=198(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (100, 127).
; PLAN: r0=100(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (186, 203) and (198, 106).
; PLAN: r0=186(x1), r1=203(y1), r2=198(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 203
LDI r2, 198
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
