; DESCRIPTION: Composite: . Then Sets a single purple pixel at (156, 126). Then Places a magenta line segment connecting (112, 183) to (109, 150).
; PLAN: r0=156(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=112(x1), r1=183(y1), r2=109(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (156, 126).
; PLAN: r0=156(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 126
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (112, 183) to (109, 150).
; PLAN: r0=112(x1), r1=183(y1), r2=109(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 183
LDI r2, 109
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
