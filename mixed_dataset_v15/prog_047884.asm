; DESCRIPTION: Composite: Renders a cyan line between points (304, 48) and (247, 10) then Sets a single white pixel at (83, 129) then Draws a blue circle centered at (278, 175) with radius 79.
; PLAN: r0=304(x1), r1=48(y1), r2=247(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=129(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=278(x), r11=175(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 48
LDI r2, 247
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 129
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 278
LDI r11, 175
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
