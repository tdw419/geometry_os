; DESCRIPTION: Composite: Places a yellow line segment connecting (229, 154) to (302, 69) then Places a magenta dot at position (218, 245) then Places a red circle of radius 67 at center (432, 96).
; PLAN: r0=229(x1), r1=154(y1), r2=302(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=245(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=432(x), r11=96(y), r12=67(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 154
LDI r2, 302
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 245
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 432
LDI r11, 96
LDI r12, 67
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
