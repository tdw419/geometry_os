; DESCRIPTION: Composite: Draws a orange line from (282, 29) to (6, 23) then Draws a black circle centered at (57, 62) with radius 44.
; PLAN: r0=282(x1), r1=29(y1), r2=6(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=62(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 29
LDI r2, 6
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 62
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
