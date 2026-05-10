; DESCRIPTION: Composite: Draws a black circle centered at (306, 109) with radius 77 then Places a yellow line segment connecting (256, 106) to (63, 244).
; PLAN: r0=306(x), r1=109(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x1), r6=106(y1), r7=63(x2), r8=244(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 109
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 106
LDI r7, 63
LDI r8, 244
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
