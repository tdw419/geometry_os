; DESCRIPTION: Composite: Draws a white circle centered at (183, 45) with radius 13 then Places a purple dot at position (52, 112) then Places a white line segment connecting (178, 126) to (90, 252).
; PLAN: r0=183(x), r1=45(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=112(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=178(x1), r11=126(y1), r12=90(x2), r13=252(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 45
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 112
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 178
LDI r11, 126
LDI r12, 90
LDI r13, 252
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
