; DESCRIPTION: Composite: . Then Renders a magenta box of size 106x47 starting at (129, 199). Then Sets a single blue pixel at (110, 185).
; PLAN: r0=129(x), r1=199(y), r2=106(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=110(x), r1=185(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta box of size 106x47 starting at (129, 199).
; PLAN: r0=129(x), r1=199(y), r2=106(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 199
LDI r2, 106
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (110, 185).
; PLAN: r0=110(x), r1=185(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 185
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
