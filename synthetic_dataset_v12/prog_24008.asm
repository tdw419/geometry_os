; DESCRIPTION: Composite: Places a orange circle of radius 65 at center (146, 137) then Sets a single magenta pixel at (85, 247).
; PLAN: r0=146(x), r1=137(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 137
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
