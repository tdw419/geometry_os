; DESCRIPTION: Composite: Renders a red disk with center (290, 88) and radius 27 then Renders a white line between points (411, 26) and (119, 74) then Sets a single white pixel at (49, 70).
; PLAN: r0=290(x), r1=88(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=26(y1), r7=119(x2), r8=74(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=70(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 88
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 26
LDI r7, 119
LDI r8, 74
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 70
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
