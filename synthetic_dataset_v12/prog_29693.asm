; DESCRIPTION: Composite: Places a black dot at position (35, 181) then Draws a green line from (327, 53) to (152, 140) then Places a green circle of radius 22 at center (125, 73).
; PLAN: r0=35(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=53(y1), r7=152(x2), r8=140(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=73(y), r12=22(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 35
LDI r1, 181
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 53
LDI r7, 152
LDI r8, 140
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 73
LDI r12, 22
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
