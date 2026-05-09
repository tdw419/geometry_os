; DESCRIPTION: Composite: Draws a magenta line from (281, 20) to (366, 100) then Places a purple dot at position (214, 253) then Draws a green circle centered at (38, 202) with radius 25.
; PLAN: r0=281(x1), r1=20(y1), r2=366(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=253(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=38(x), r11=202(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 20
LDI r2, 366
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 253
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 38
LDI r11, 202
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
