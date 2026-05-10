; DESCRIPTION: Composite: Sets a single red pixel at (184, 57) then Renders a white disk with center (346, 144) and radius 23.
; PLAN: r0=184(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=144(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 346
LDI r6, 144
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
