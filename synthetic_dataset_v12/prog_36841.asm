; DESCRIPTION: Composite: Sets a single purple pixel at (264, 120) then Renders a cyan disk with center (464, 206) and radius 31.
; PLAN: r0=264(x), r1=120(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=464(x), r6=206(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 264
LDI r1, 120
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 464
LDI r6, 206
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
