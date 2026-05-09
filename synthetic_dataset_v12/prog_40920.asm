; DESCRIPTION: Composite: Draws a green circle centered at (313, 102) with radius 22 then Places a white line segment connecting (380, 88) to (174, 142) then Places a cyan dot at position (266, 54).
; PLAN: r0=313(x), r1=102(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x1), r6=88(y1), r7=174(x2), r8=142(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=266(x), r11=54(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 102
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 88
LDI r7, 174
LDI r8, 142
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 54
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
