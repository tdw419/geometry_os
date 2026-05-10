; DESCRIPTION: Composite: Places a magenta dot at position (408, 169) then Places a black circle of radius 15 at center (409, 153) then Renders a white line between points (479, 123) and (65, 238).
; PLAN: r0=408(x), r1=169(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=153(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=479(x1), r11=123(y1), r12=65(x2), r13=238(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 169
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 153
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 479
LDI r11, 123
LDI r12, 65
LDI r13, 238
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
