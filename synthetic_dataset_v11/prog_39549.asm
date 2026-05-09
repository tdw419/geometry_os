; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (10, 131). Then Draws a orange line from (184, 181) to (147, 40).
; PLAN: r0=10(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=184(x1), r1=181(y1), r2=147(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (10, 131).
; PLAN: r0=10(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 131
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (184, 181) to (147, 40).
; PLAN: r0=184(x1), r1=181(y1), r2=147(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 181
LDI r2, 147
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
