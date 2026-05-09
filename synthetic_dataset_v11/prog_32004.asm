; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (9, 110) to (218, 234). Then Sets a single orange pixel at (2, 63).
; PLAN: r0=9(x1), r1=110(y1), r2=218(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=2(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (9, 110) to (218, 234).
; PLAN: r0=9(x1), r1=110(y1), r2=218(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 110
LDI r2, 218
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (2, 63).
; PLAN: r0=2(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 63
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
