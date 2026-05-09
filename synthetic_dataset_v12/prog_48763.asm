; DESCRIPTION: Composite: Draws a purple rectangle at (120, 8) with width 27 and height 95 then Sets a single yellow pixel at (265, 178) then Renders a red line between points (475, 35) and (241, 17).
; PLAN: r0=120(x), r1=8(y), r2=27(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=178(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=475(x1), r11=35(y1), r12=241(x2), r13=17(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 8
LDI r2, 27
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 178
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 475
LDI r11, 35
LDI r12, 241
LDI r13, 17
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
