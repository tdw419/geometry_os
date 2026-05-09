; DESCRIPTION: Composite: Places a red line segment connecting (281, 61) to (407, 0) then Places a yellow dot at position (164, 254) then Renders a magenta disk with center (273, 88) and radius 50.
; PLAN: r0=281(x1), r1=61(y1), r2=407(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=254(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=273(x), r11=88(y), r12=50(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 61
LDI r2, 407
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 254
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 273
LDI r11, 88
LDI r12, 50
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
