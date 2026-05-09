; DESCRIPTION: Composite: Sets a single purple pixel at (283, 255) then Renders a blue disk with center (236, 86) and radius 36.
; PLAN: r0=283(x), r1=255(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=86(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 283
LDI r1, 255
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 86
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
