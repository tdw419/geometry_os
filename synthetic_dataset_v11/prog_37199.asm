; DESCRIPTION: Composite: . Then Sets a single red pixel at (73, 7). Then Renders a black line between points (221, 188) and (38, 11).
; PLAN: r0=73(x), r1=7(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=221(x1), r1=188(y1), r2=38(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (73, 7).
; PLAN: r0=73(x), r1=7(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 7
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (221, 188) and (38, 11).
; PLAN: r0=221(x1), r1=188(y1), r2=38(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 188
LDI r2, 38
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
