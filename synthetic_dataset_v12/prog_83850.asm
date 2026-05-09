; DESCRIPTION: Composite: Renders a white line between points (133, 65) and (133, 1) then Draws a purple circle centered at (304, 114) with radius 32 then Sets a single green pixel at (47, 149).
; PLAN: r0=133(x1), r1=65(y1), r2=133(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=114(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x), r11=149(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 65
LDI r2, 133
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 114
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 149
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
