; DESCRIPTION: Composite: . Then Places a orange line segment connecting (5, 248) to (226, 154). Then Sets a single green pixel at (212, 104).
; PLAN: r0=5(x1), r1=248(y1), r2=226(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=212(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (5, 248) to (226, 154).
; PLAN: r0=5(x1), r1=248(y1), r2=226(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 248
LDI r2, 226
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (212, 104).
; PLAN: r0=212(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 104
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
