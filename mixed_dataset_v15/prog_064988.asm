; DESCRIPTION: Composite: Sets a single green pixel at (482, 145) then Renders a white line between points (190, 182) and (134, 243) then Renders a cyan disk with center (462, 39) and radius 27.
; PLAN: r0=482(x), r1=145(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=190(x1), r6=182(y1), r7=134(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=462(x), r11=39(y), r12=27(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 145
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 190
LDI r6, 182
LDI r7, 134
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 39
LDI r12, 27
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
