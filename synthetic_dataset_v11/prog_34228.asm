; DESCRIPTION: Composite: . Then Renders a blue line between points (10, 31) and (24, 92). Then Sets a single green pixel at (92, 62).
; PLAN: r0=10(x1), r1=31(y1), r2=24(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=92(x), r1=62(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (10, 31) and (24, 92).
; PLAN: r0=10(x1), r1=31(y1), r2=24(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 31
LDI r2, 24
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (92, 62).
; PLAN: r0=92(x), r1=62(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 62
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
