; DESCRIPTION: Composite: Sets a single yellow pixel at (313, 123) then Renders a red disk with center (192, 166) and radius 64 then Places a orange line segment connecting (208, 117) to (370, 120).
; PLAN: r0=313(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=166(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x1), r11=117(y1), r12=370(x2), r13=120(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 192
LDI r6, 166
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 117
LDI r12, 370
LDI r13, 120
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
