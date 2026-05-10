; DESCRIPTION: Composite: Places a red line segment connecting (183, 193) to (411, 239) then Places a green dot at position (406, 52) then Places a green circle of radius 23 at center (336, 138).
; PLAN: r0=183(x1), r1=193(y1), r2=411(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=52(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=336(x), r11=138(y), r12=23(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 193
LDI r2, 411
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 52
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 336
LDI r11, 138
LDI r12, 23
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
