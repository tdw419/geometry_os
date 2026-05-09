; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (135, 153) with radius 65. Then Sets a single red pixel at (229, 194).
; PLAN: r0=135(x), r1=153(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=229(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (135, 153) with radius 65.
; PLAN: r0=135(x), r1=153(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 153
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (229, 194).
; PLAN: r0=229(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
