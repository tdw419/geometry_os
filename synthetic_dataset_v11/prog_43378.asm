; DESCRIPTION: Composite: . Then Sets a single red pixel at (80, 14). Then Draws a cyan line from (114, 155) to (227, 199).
; PLAN: r0=80(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=114(x1), r1=155(y1), r2=227(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (80, 14).
; PLAN: r0=80(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 14
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (114, 155) to (227, 199).
; PLAN: r0=114(x1), r1=155(y1), r2=227(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 155
LDI r2, 227
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
