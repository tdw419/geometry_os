; DESCRIPTION: Composite: Draws a green circle centered at (340, 113) with radius 50 then Sets a single cyan pixel at (187, 2) then Places a purple line segment connecting (191, 23) to (159, 135).
; PLAN: r0=340(x), r1=113(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=2(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=191(x1), r11=23(y1), r12=159(x2), r13=135(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 113
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 2
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 191
LDI r11, 23
LDI r12, 159
LDI r13, 135
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
