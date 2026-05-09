; DESCRIPTION: Composite: Places a black line segment connecting (152, 188) to (91, 104) then Draws a red circle centered at (361, 174) with radius 69.
; PLAN: r0=152(x1), r1=188(y1), r2=91(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=174(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 152
LDI r1, 188
LDI r2, 91
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 174
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
