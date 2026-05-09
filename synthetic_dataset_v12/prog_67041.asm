; DESCRIPTION: Composite: Sets a single orange pixel at (476, 253) then Places a purple line segment connecting (238, 212) to (479, 73) then Renders a purple disk with center (368, 193) and radius 51.
; PLAN: r0=476(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=238(x1), r6=212(y1), r7=479(x2), r8=73(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=193(y), r12=51(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 476
LDI r1, 253
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 238
LDI r6, 212
LDI r7, 479
LDI r8, 73
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 193
LDI r12, 51
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
