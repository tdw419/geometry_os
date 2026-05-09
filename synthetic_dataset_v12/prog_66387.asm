; DESCRIPTION: Composite: Renders a white line between points (288, 122) and (226, 166) then Draws a purple circle centered at (142, 55) with radius 50 then Sets a single magenta pixel at (419, 215).
; PLAN: r0=288(x1), r1=122(y1), r2=226(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=55(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x), r11=215(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 122
LDI r2, 226
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 55
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 215
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
