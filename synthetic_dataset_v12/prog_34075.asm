; DESCRIPTION: Composite: Draws a black circle centered at (223, 204) with radius 43 then Renders a magenta line between points (321, 251) and (100, 241).
; PLAN: r0=223(x), r1=204(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=251(y1), r7=100(x2), r8=241(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 204
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 251
LDI r7, 100
LDI r8, 241
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
