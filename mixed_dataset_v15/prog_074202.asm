; DESCRIPTION: Composite: Renders a blue line between points (280, 73) and (194, 163) then Places a green dot at position (364, 164) then Places a magenta circle of radius 57 at center (196, 149).
; PLAN: r0=280(x1), r1=73(y1), r2=194(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=164(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=196(x), r11=149(y), r12=57(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 73
LDI r2, 194
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 164
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 196
LDI r11, 149
LDI r12, 57
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
