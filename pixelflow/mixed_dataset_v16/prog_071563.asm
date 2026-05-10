; DESCRIPTION: Composite: Creates a green rectangular region at (207, 227) spanning 36 by 19 pixels then Sets a single yellow pixel at (240, 18) then Renders a cyan line between points (417, 127) and (475, 217).
; PLAN: r0=207(x), r1=227(y), r2=36(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=18(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=417(x1), r11=127(y1), r12=475(x2), r13=217(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 227
LDI r2, 36
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 18
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 417
LDI r11, 127
LDI r12, 475
LDI r13, 217
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
