; DESCRIPTION: Composite: Draws a yellow rectangle at (418, 137) with width 65 and height 106 then Places a yellow line segment connecting (173, 35) to (357, 177) then Places a green dot at position (325, 202).
; PLAN: r0=418(x), r1=137(y), r2=65(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x1), r6=35(y1), r7=357(x2), r8=177(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=202(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 137
LDI r2, 65
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 35
LDI r7, 357
LDI r8, 177
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 202
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
