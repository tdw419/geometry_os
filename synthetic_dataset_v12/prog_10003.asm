; DESCRIPTION: Composite: Renders a magenta disk with center (467, 133) and radius 37 then Places a white dot at position (74, 30) then Places a orange line segment connecting (394, 188) to (489, 181).
; PLAN: r0=467(x), r1=133(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=30(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=394(x1), r11=188(y1), r12=489(x2), r13=181(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 133
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 30
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 394
LDI r11, 188
LDI r12, 489
LDI r13, 181
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
