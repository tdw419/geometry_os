; DESCRIPTION: Composite: Renders a orange disk with center (231, 186) and radius 65 then Sets a single white pixel at (148, 226).
; PLAN: r0=231(x), r1=186(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x), r6=226(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 186
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 226
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
