; DESCRIPTION: Composite: Places a green circle of radius 16 at center (183, 172) then Places a red dot at position (108, 148) then Renders a cyan line between points (431, 71) and (300, 49).
; PLAN: r0=183(x), r1=172(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=148(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=431(x1), r11=71(y1), r12=300(x2), r13=49(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 172
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 148
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 431
LDI r11, 71
LDI r12, 300
LDI r13, 49
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
