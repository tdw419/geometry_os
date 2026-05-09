; DESCRIPTION: Composite: Places a orange dot at position (157, 206) then Places a yellow line segment connecting (443, 171) to (143, 203) then Places a magenta circle of radius 10 at center (412, 145).
; PLAN: r0=157(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=443(x1), r6=171(y1), r7=143(x2), r8=203(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=412(x), r11=145(y), r12=10(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 206
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 443
LDI r6, 171
LDI r7, 143
LDI r8, 203
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 145
LDI r12, 10
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
