; DESCRIPTION: Composite: Places a red dot at position (195, 149) then Places a magenta circle of radius 60 at center (98, 61) then Renders a purple line between points (134, 103) and (444, 121).
; PLAN: r0=195(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=61(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=134(x1), r11=103(y1), r12=444(x2), r13=121(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 98
LDI r6, 61
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 134
LDI r11, 103
LDI r12, 444
LDI r13, 121
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
