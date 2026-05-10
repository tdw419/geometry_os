; DESCRIPTION: Composite: Sets a single orange pixel at (366, 174) then Renders a purple disk with center (103, 96) and radius 64.
; PLAN: r0=366(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=96(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 174
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 103
LDI r6, 96
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
