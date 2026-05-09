; DESCRIPTION: Composite: Renders a blue line between points (346, 155) and (357, 218) then Draws a blue circle centered at (358, 108) with radius 71 then Sets a single purple pixel at (464, 130).
; PLAN: r0=346(x1), r1=155(y1), r2=357(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=108(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=464(x), r11=130(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 155
LDI r2, 357
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 108
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 464
LDI r11, 130
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
