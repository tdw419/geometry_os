; DESCRIPTION: Composite: Renders a red line between points (478, 86) and (195, 200) then Places a green 39x57 rectangle at position (468, 102) then Renders a yellow disk with center (127, 138) and radius 17.
; PLAN: r0=478(x1), r1=86(y1), r2=195(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=102(y), r7=39(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x), r11=138(y), r12=17(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 478
LDI r1, 86
LDI r2, 195
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 102
LDI r7, 39
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 138
LDI r12, 17
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
