; DESCRIPTION: Composite: Places a purple line segment connecting (302, 163) to (317, 90) then Places a magenta circle of radius 12 at center (228, 82) then Sets a single orange pixel at (209, 77).
; PLAN: r0=302(x1), r1=163(y1), r2=317(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=82(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=77(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 302
LDI r1, 163
LDI r2, 317
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 82
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 77
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
