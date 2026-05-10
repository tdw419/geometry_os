; DESCRIPTION: Composite: Renders a magenta line between points (9, 60) and (338, 138) then Creates a green circular shape at (238, 114) with radius 45 then Sets a single white pixel at (468, 38).
; PLAN: r0=9(x1), r1=60(y1), r2=338(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=114(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x), r11=38(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 60
LDI r2, 338
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 114
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 38
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
