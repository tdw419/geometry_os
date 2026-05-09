; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (10, 92) to (129, 224). Then Sets a single black pixel at (203, 11).
; PLAN: r0=10(x1), r1=92(y1), r2=129(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=203(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (10, 92) to (129, 224).
; PLAN: r0=10(x1), r1=92(y1), r2=129(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 92
LDI r2, 129
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (203, 11).
; PLAN: r0=203(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 11
LDI r2, 0x000000
PSET r0, r1, r2
HALT
