; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (194, 54). Then Places a black line segment connecting (42, 69) to (2, 14).
; PLAN: r0=194(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=42(x1), r1=69(y1), r2=2(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (194, 54).
; PLAN: r0=194(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 54
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (42, 69) to (2, 14).
; PLAN: r0=42(x1), r1=69(y1), r2=2(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 69
LDI r2, 2
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
