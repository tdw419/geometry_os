; DESCRIPTION: Composite: Places a white line segment connecting (486, 234) to (129, 168) then Sets a single green pixel at (357, 50) then Draws a red circle centered at (384, 131) with radius 43.
; PLAN: r0=486(x1), r1=234(y1), r2=129(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=50(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=384(x), r11=131(y), r12=43(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 486
LDI r1, 234
LDI r2, 129
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 50
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 384
LDI r11, 131
LDI r12, 43
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
