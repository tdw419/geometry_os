; DESCRIPTION: Composite: Places a green dot at position (306, 102) then Renders a green line between points (214, 70) and (90, 53) then Draws a purple circle centered at (265, 70) with radius 22.
; PLAN: r0=306(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=214(x1), r6=70(y1), r7=90(x2), r8=53(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=70(y), r12=22(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 214
LDI r6, 70
LDI r7, 90
LDI r8, 53
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 70
LDI r12, 22
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
