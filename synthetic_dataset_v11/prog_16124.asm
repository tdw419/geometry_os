; DESCRIPTION: Composite: . Then Places a orange line segment connecting (154, 79) to (126, 74). Then Sets a single magenta pixel at (36, 164).
; PLAN: r0=154(x1), r1=79(y1), r2=126(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=36(x), r1=164(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (154, 79) to (126, 74).
; PLAN: r0=154(x1), r1=79(y1), r2=126(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 79
LDI r2, 126
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (36, 164).
; PLAN: r0=36(x), r1=164(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 164
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
