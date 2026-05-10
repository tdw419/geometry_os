; DESCRIPTION: Composite: Sets a single yellow pixel at (273, 31) then Draws a green line from (95, 164) to (180, 148) then Places a black circle of radius 27 at center (197, 156).
; PLAN: r0=273(x), r1=31(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=95(x1), r6=164(y1), r7=180(x2), r8=148(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=156(y), r12=27(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 31
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 95
LDI r6, 164
LDI r7, 180
LDI r8, 148
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 156
LDI r12, 27
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
