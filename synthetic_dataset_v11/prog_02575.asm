; DESCRIPTION: Composite: . Then Sets a single black pixel at (157, 123). Then Renders a blue line between points (102, 226) and (254, 204).
; PLAN: r0=157(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=102(x1), r1=226(y1), r2=254(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (157, 123).
; PLAN: r0=157(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 157
LDI r1, 123
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (102, 226) and (254, 204).
; PLAN: r0=102(x1), r1=226(y1), r2=254(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 226
LDI r2, 254
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
