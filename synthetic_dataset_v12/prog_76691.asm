; DESCRIPTION: Composite: Places a cyan line segment connecting (175, 142) to (396, 33) then Places a blue dot at position (171, 44) then Draws a cyan circle centered at (286, 90) with radius 80.
; PLAN: r0=175(x1), r1=142(y1), r2=396(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=44(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=90(y), r12=80(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 142
LDI r2, 396
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 44
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 286
LDI r11, 90
LDI r12, 80
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
