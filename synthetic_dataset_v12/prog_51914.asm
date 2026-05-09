; DESCRIPTION: Composite: Places a magenta dot at position (198, 62) then Renders a blue disk with center (246, 121) and radius 77 then Renders a orange line between points (247, 43) and (323, 49).
; PLAN: r0=198(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=121(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x1), r11=43(y1), r12=323(x2), r13=49(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 121
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 43
LDI r12, 323
LDI r13, 49
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
