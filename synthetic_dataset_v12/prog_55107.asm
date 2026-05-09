; DESCRIPTION: Composite: Places a green dot at position (386, 74) then Places a blue line segment connecting (221, 46) to (286, 21) then Draws a green circle centered at (29, 23) with radius 11.
; PLAN: r0=386(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=221(x1), r6=46(y1), r7=286(x2), r8=21(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=29(x), r11=23(y), r12=11(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 386
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 221
LDI r6, 46
LDI r7, 286
LDI r8, 21
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 23
LDI r12, 11
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
