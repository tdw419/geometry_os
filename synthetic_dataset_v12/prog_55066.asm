; DESCRIPTION: Composite: Renders a white line between points (394, 112) and (11, 51) then Creates a cyan circular shape at (364, 85) with radius 71.
; PLAN: r0=394(x1), r1=112(y1), r2=11(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=85(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 112
LDI r2, 11
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 85
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
