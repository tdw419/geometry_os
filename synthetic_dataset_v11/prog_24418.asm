; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (212, 87) to (160, 108). Then Sets a single magenta pixel at (6, 73).
; PLAN: r0=212(x1), r1=87(y1), r2=160(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=6(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (212, 87) to (160, 108).
; PLAN: r0=212(x1), r1=87(y1), r2=160(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 87
LDI r2, 160
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (6, 73).
; PLAN: r0=6(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 73
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
