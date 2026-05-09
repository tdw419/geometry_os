; DESCRIPTION: Composite: Renders a yellow disk with center (172, 222) and radius 11 then Sets a single cyan pixel at (373, 231) then Places a red line segment connecting (49, 160) to (62, 95).
; PLAN: r0=172(x), r1=222(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=231(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=49(x1), r11=160(y1), r12=62(x2), r13=95(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 222
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 231
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 49
LDI r11, 160
LDI r12, 62
LDI r13, 95
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
