; DESCRIPTION: Composite: Sets a single white pixel at (145, 126) then Draws a red circle centered at (87, 144) with radius 18 then Places a magenta line segment connecting (258, 145) to (491, 42).
; PLAN: r0=145(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=144(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x1), r11=145(y1), r12=491(x2), r13=42(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 144
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 145
LDI r12, 491
LDI r13, 42
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
