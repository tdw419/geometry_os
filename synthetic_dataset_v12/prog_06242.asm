; DESCRIPTION: Composite: Renders a green box of size 100x63 starting at (125, 177) then Places a blue dot at position (141, 72) then Draws a black line from (162, 236) to (300, 150).
; PLAN: r0=125(x), r1=177(y), r2=100(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=72(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=162(x1), r11=236(y1), r12=300(x2), r13=150(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 177
LDI r2, 100
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 72
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 162
LDI r11, 236
LDI r12, 300
LDI r13, 150
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
