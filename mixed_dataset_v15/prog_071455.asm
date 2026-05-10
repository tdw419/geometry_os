; DESCRIPTION: Composite: Creates a cyan circular shape at (119, 170) with radius 54 then Sets a single yellow pixel at (396, 135) then Renders a white line between points (182, 125) and (458, 192).
; PLAN: r0=119(x), r1=170(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=135(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=182(x1), r11=125(y1), r12=458(x2), r13=192(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 170
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 135
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 182
LDI r11, 125
LDI r12, 458
LDI r13, 192
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
