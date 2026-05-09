; DESCRIPTION: Composite: Renders a magenta line between points (361, 118) and (436, 136) then Creates a white circular shape at (280, 120) with radius 47 then Sets a single white pixel at (104, 6).
; PLAN: r0=361(x1), r1=118(y1), r2=436(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=120(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=6(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 118
LDI r2, 436
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 120
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 6
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
