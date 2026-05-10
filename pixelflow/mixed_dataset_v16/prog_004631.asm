; DESCRIPTION: Composite: Places a magenta circle of radius 74 at center (411, 181) then Sets a single orange pixel at (12, 48).
; PLAN: r0=411(x), r1=181(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=48(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 181
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 48
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
