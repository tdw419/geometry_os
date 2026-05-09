; DESCRIPTION: Composite: Draws a green circle centered at (99, 155) with radius 69 then Sets a single orange pixel at (102, 161) then Draws a magenta line from (311, 204) to (101, 132).
; PLAN: r0=99(x), r1=155(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=161(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=311(x1), r11=204(y1), r12=101(x2), r13=132(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 155
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 161
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 311
LDI r11, 204
LDI r12, 101
LDI r13, 132
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
