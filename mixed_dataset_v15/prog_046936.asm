; DESCRIPTION: Composite: Creates a yellow circular shape at (262, 118) with radius 62 then Renders a white line between points (214, 52) and (293, 69) then Sets a single yellow pixel at (55, 165).
; PLAN: r0=262(x), r1=118(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x1), r6=52(y1), r7=293(x2), r8=69(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=165(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 118
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 52
LDI r7, 293
LDI r8, 69
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 165
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
