; DESCRIPTION: Composite: Draws a yellow line from (149, 53) to (414, 101) then Places a orange circle of radius 66 at center (240, 139).
; PLAN: r0=149(x1), r1=53(y1), r2=414(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=139(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 149
LDI r1, 53
LDI r2, 414
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 139
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
