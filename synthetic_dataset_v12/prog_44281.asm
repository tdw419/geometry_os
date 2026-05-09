; DESCRIPTION: Composite: Places a magenta circle of radius 59 at center (181, 166) then Sets a single yellow pixel at (400, 235).
; PLAN: r0=181(x), r1=166(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=235(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 166
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 235
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
