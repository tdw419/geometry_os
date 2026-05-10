; DESCRIPTION: Composite: Renders a blue line between points (361, 95) and (149, 204) then Places a cyan dot at position (148, 110) then Creates a blue rectangular region at (310, 160) spanning 112 by 45 pixels.
; PLAN: r0=361(x1), r1=95(y1), r2=149(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=110(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=310(x), r11=160(y), r12=112(width), r13=45(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 95
LDI r2, 149
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 110
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 310
LDI r11, 160
LDI r12, 112
LDI r13, 45
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
