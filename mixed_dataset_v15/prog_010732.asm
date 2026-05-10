; DESCRIPTION: Composite: Renders a white line between points (462, 66) and (121, 197) then Places a red dot at position (449, 44) then Draws a white circle centered at (209, 34) with radius 13.
; PLAN: r0=462(x1), r1=66(y1), r2=121(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=44(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=34(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 462
LDI r1, 66
LDI r2, 121
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 44
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 209
LDI r11, 34
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
