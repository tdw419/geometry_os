; DESCRIPTION: Composite: Sets a single purple pixel at (35, 255) then Renders a black disk with center (176, 133) and radius 16.
; PLAN: r0=35(x), r1=255(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=133(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 35
LDI r1, 255
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 133
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
