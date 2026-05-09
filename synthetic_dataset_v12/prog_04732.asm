; DESCRIPTION: Composite: Sets a single blue pixel at (377, 141) then Renders a cyan disk with center (243, 162) and radius 64.
; PLAN: r0=377(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=162(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 162
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
