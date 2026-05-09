; DESCRIPTION: Composite: . Then Sets a single blue pixel at (48, 154). Then Renders a green line between points (40, 35) and (4, 60).
; PLAN: r0=48(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=40(x1), r1=35(y1), r2=4(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (48, 154).
; PLAN: r0=48(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green line between points (40, 35) and (4, 60).
; PLAN: r0=40(x1), r1=35(y1), r2=4(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 35
LDI r2, 4
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
