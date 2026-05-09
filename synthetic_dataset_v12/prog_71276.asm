; DESCRIPTION: Composite: Draws a cyan circle centered at (349, 92) with radius 42 then Places a cyan line segment connecting (132, 147) to (365, 141) then Creates a black rectangular region at (172, 19) spanning 106 by 33 pixels.
; PLAN: r0=349(x), r1=92(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=147(y1), r7=365(x2), r8=141(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=19(y), r12=106(width), r13=33(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 92
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 147
LDI r7, 365
LDI r8, 141
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 19
LDI r12, 106
LDI r13, 33
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
