; DESCRIPTION: Composite: Places a blue dot at position (140, 28) then Draws a blue line from (35, 1) to (236, 174) then Places a white circle of radius 46 at center (122, 181).
; PLAN: r0=140(x), r1=28(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=1(y1), r7=236(x2), r8=174(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=181(y), r12=46(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 140
LDI r1, 28
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 1
LDI r7, 236
LDI r8, 174
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 181
LDI r12, 46
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
