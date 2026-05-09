; DESCRIPTION: Composite: Draws a purple circle centered at (214, 224) with radius 21 then Places a yellow dot at position (425, 211) then Renders a white line between points (480, 35) and (121, 77).
; PLAN: r0=214(x), r1=224(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=211(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=480(x1), r11=35(y1), r12=121(x2), r13=77(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 224
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 211
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 480
LDI r11, 35
LDI r12, 121
LDI r13, 77
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
