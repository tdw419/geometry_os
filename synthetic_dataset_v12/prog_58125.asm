; DESCRIPTION: Composite: Places a yellow dot at position (138, 200) then Places a green circle of radius 62 at center (102, 115) then Places a red line segment connecting (34, 208) to (462, 253).
; PLAN: r0=138(x), r1=200(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=115(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x1), r11=208(y1), r12=462(x2), r13=253(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 200
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 102
LDI r6, 115
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 208
LDI r12, 462
LDI r13, 253
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
