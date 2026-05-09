; DESCRIPTION: Composite: Draws a magenta line from (38, 189) to (171, 60) then Places a blue dot at position (346, 148) then Renders a black disk with center (87, 162) and radius 68.
; PLAN: r0=38(x1), r1=189(y1), r2=171(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=148(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=162(y), r12=68(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 38
LDI r1, 189
LDI r2, 171
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 148
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 87
LDI r11, 162
LDI r12, 68
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
