; DESCRIPTION: Composite: Sets a single white pixel at (448, 239) then Renders a cyan line between points (466, 19) and (373, 150) then Renders a yellow disk with center (321, 102) and radius 77.
; PLAN: r0=448(x), r1=239(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=466(x1), r6=19(y1), r7=373(x2), r8=150(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=102(y), r12=77(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 239
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 466
LDI r6, 19
LDI r7, 373
LDI r8, 150
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 102
LDI r12, 77
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
