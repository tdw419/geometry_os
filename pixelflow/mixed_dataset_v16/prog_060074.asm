; DESCRIPTION: Composite: Renders a orange disk with center (311, 179) and radius 42 then Sets a single magenta pixel at (235, 143).
; PLAN: r0=311(x), r1=179(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=143(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 179
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 143
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
