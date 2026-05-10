; DESCRIPTION: Composite: Draws a red rectangle at (303, 181) with width 15 and height 49 then Sets a single cyan pixel at (418, 70) then Renders a yellow line between points (427, 166) and (338, 23).
; PLAN: r0=303(x), r1=181(y), r2=15(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=70(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=427(x1), r11=166(y1), r12=338(x2), r13=23(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 181
LDI r2, 15
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 70
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 427
LDI r11, 166
LDI r12, 338
LDI r13, 23
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
