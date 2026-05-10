; DESCRIPTION: Composite: Sets a single orange pixel at (308, 194) then Renders a green line between points (263, 225) and (118, 143) then Places a blue circle of radius 39 at center (222, 174).
; PLAN: r0=308(x), r1=194(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=263(x1), r6=225(y1), r7=118(x2), r8=143(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=174(y), r12=39(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 194
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 263
LDI r6, 225
LDI r7, 118
LDI r8, 143
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 174
LDI r12, 39
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
