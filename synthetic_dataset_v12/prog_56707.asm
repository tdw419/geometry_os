; DESCRIPTION: Composite: Places a magenta dot at position (487, 72) then Draws a green line from (6, 55) to (97, 53) then Renders a purple disk with center (195, 165) and radius 17.
; PLAN: r0=487(x), r1=72(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=6(x1), r6=55(y1), r7=97(x2), r8=53(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=195(x), r11=165(y), r12=17(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 487
LDI r1, 72
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 6
LDI r6, 55
LDI r7, 97
LDI r8, 53
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 165
LDI r12, 17
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
