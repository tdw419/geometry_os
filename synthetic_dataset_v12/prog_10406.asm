; DESCRIPTION: Composite: Sets a single purple pixel at (121, 13) then Renders a red disk with center (202, 87) and radius 80.
; PLAN: r0=121(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=87(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 13
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 87
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
