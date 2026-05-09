; DESCRIPTION: Composite: . Then Places a black line segment connecting (95, 3) to (118, 69). Then Sets a single cyan pixel at (12, 129).
; PLAN: r0=95(x1), r1=3(y1), r2=118(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=12(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (95, 3) to (118, 69).
; PLAN: r0=95(x1), r1=3(y1), r2=118(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 3
LDI r2, 118
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (12, 129).
; PLAN: r0=12(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 129
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
