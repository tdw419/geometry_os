; DESCRIPTION: Composite: Sets a single green pixel at (277, 102) then Draws a purple line from (274, 125) to (244, 214) then Draws a black circle centered at (102, 209) with radius 42.
; PLAN: r0=277(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=274(x1), r6=125(y1), r7=244(x2), r8=214(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=209(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 274
LDI r6, 125
LDI r7, 244
LDI r8, 214
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 209
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
