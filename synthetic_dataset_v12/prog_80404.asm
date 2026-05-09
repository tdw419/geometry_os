; DESCRIPTION: Composite: Places a green dot at position (108, 121) then Draws a yellow line from (461, 110) to (247, 181) then Renders a orange disk with center (392, 157) and radius 30.
; PLAN: r0=108(x), r1=121(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=110(y1), r7=247(x2), r8=181(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=157(y), r12=30(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 121
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 461
LDI r6, 110
LDI r7, 247
LDI r8, 181
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 157
LDI r12, 30
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
