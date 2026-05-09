; DESCRIPTION: Composite: Places a yellow line segment connecting (54, 80) to (186, 205) then Places a orange dot at position (168, 17) then Renders a green disk with center (423, 146) and radius 48.
; PLAN: r0=54(x1), r1=80(y1), r2=186(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=17(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=146(y), r12=48(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 54
LDI r1, 80
LDI r2, 186
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 17
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 423
LDI r11, 146
LDI r12, 48
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
