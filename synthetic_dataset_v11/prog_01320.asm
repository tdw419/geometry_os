; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (83, 35) to (214, 11). Then Sets a single green pixel at (91, 18).
; PLAN: r0=83(x1), r1=35(y1), r2=214(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=18(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (83, 35) to (214, 11).
; PLAN: r0=83(x1), r1=35(y1), r2=214(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 35
LDI r2, 214
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (91, 18).
; PLAN: r0=91(x), r1=18(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 18
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
