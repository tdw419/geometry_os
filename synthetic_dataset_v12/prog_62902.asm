; DESCRIPTION: Composite: Renders a purple disk with center (314, 200) and radius 27 then Draws a blue line from (189, 16) to (234, 127) then Places a magenta 65x23 rectangle at position (426, 140).
; PLAN: r0=314(x), r1=200(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x1), r6=16(y1), r7=234(x2), r8=127(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=140(y), r12=65(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 200
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 16
LDI r7, 234
LDI r8, 127
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 140
LDI r12, 65
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
