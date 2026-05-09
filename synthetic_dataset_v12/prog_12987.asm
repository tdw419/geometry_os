; DESCRIPTION: Composite: Draws a orange circle centered at (170, 132) with radius 32 then Places a green line segment connecting (123, 155) to (12, 71).
; PLAN: r0=170(x), r1=132(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x1), r6=155(y1), r7=12(x2), r8=71(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 132
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 155
LDI r7, 12
LDI r8, 71
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
