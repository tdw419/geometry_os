; DESCRIPTION: Composite: Sets a single orange pixel at (132, 181) then Places a white line segment connecting (276, 228) to (106, 232) then Renders a purple disk with center (195, 171) and radius 16.
; PLAN: r0=132(x), r1=181(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=276(x1), r6=228(y1), r7=106(x2), r8=232(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=195(x), r11=171(y), r12=16(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 181
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 276
LDI r6, 228
LDI r7, 106
LDI r8, 232
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 171
LDI r12, 16
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
