; DESCRIPTION: Composite: Sets a single red pixel at (456, 216) then Renders a green disk with center (80, 113) and radius 73.
; PLAN: r0=456(x), r1=216(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=113(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 456
LDI r1, 216
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 80
LDI r6, 113
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
