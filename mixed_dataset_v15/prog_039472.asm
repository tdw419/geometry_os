; DESCRIPTION: Composite: Sets a single magenta pixel at (109, 144) then Places a blue circle of radius 14 at center (136, 16).
; PLAN: r0=109(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=16(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 16
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
