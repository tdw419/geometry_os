; DESCRIPTION: Composite: Draws a green line from (457, 18) to (72, 12) then Places a blue dot at position (13, 143) then Renders a yellow disk with center (73, 143) and radius 48.
; PLAN: r0=457(x1), r1=18(y1), r2=72(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=143(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=143(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 457
LDI r1, 18
LDI r2, 72
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 143
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 73
LDI r11, 143
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
