; DESCRIPTION: Composite: Sets a single magenta pixel at (91, 240) then Renders a blue line between points (136, 141) and (190, 56) then Places a blue circle of radius 32 at center (383, 128).
; PLAN: r0=91(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=136(x1), r6=141(y1), r7=190(x2), r8=56(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=383(x), r11=128(y), r12=32(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 91
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 141
LDI r7, 190
LDI r8, 56
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 128
LDI r12, 32
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
