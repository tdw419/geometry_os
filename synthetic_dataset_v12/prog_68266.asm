; DESCRIPTION: Composite: Draws a blue line from (499, 254) to (244, 205) then Draws a black circle centered at (431, 104) with radius 16.
; PLAN: r0=499(x1), r1=254(y1), r2=244(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=104(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 254
LDI r2, 244
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 104
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
