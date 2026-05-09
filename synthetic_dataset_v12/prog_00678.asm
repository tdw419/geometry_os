; DESCRIPTION: Composite: Renders a cyan line between points (105, 177) and (234, 174) then Creates a yellow rectangular region at (347, 164) spanning 80 by 36 pixels then Draws a magenta circle centered at (367, 198) with radius 16.
; PLAN: r0=105(x1), r1=177(y1), r2=234(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=164(y), r7=80(width), r8=36(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=198(y), r12=16(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 177
LDI r2, 234
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 164
LDI r7, 80
LDI r8, 36
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 198
LDI r12, 16
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
