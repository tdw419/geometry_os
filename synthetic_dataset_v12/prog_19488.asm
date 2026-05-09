; DESCRIPTION: Composite: Sets a single white pixel at (502, 228) then Places a black line segment connecting (205, 43) to (188, 148) then Draws a green circle centered at (126, 56) with radius 15.
; PLAN: r0=502(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=205(x1), r6=43(y1), r7=188(x2), r8=148(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=56(y), r12=15(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 502
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 205
LDI r6, 43
LDI r7, 188
LDI r8, 148
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 56
LDI r12, 15
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
