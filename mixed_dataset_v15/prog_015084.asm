; DESCRIPTION: Composite: Draws a black circle centered at (203, 146) with radius 72 then Sets a single orange pixel at (54, 73) then Renders a yellow line between points (401, 246) and (140, 94).
; PLAN: r0=203(x), r1=146(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=73(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=401(x1), r11=246(y1), r12=140(x2), r13=94(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 146
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 73
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 401
LDI r11, 246
LDI r12, 140
LDI r13, 94
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
