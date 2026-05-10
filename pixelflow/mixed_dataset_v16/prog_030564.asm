; DESCRIPTION: Composite: Sets a single orange pixel at (277, 210) then Renders a red disk with center (118, 160) and radius 79.
; PLAN: r0=277(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=160(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 277
LDI r1, 210
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 118
LDI r6, 160
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
