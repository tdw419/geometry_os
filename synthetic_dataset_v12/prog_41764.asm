; DESCRIPTION: Composite: Draws a green line from (116, 235) to (400, 137) then Places a magenta circle of radius 21 at center (216, 97) then Sets a single purple pixel at (69, 196).
; PLAN: r0=116(x1), r1=235(y1), r2=400(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=97(y), r7=21(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x), r11=196(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 235
LDI r2, 400
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 97
LDI r7, 21
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 196
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
