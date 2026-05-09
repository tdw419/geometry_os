; DESCRIPTION: Composite: Renders a purple disk with center (235, 171) and radius 80 then Sets a single purple pixel at (268, 60) then Draws a purple line from (383, 212) to (374, 158).
; PLAN: r0=235(x), r1=171(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=60(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=383(x1), r11=212(y1), r12=374(x2), r13=158(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 171
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 60
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 383
LDI r11, 212
LDI r12, 374
LDI r13, 158
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
