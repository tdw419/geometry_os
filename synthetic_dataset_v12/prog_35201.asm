; DESCRIPTION: Composite: Draws a magenta line from (276, 163) to (179, 19) then Renders a purple disk with center (455, 209) and radius 10 then Draws a green rectangle at (21, 111) with width 77 and height 47.
; PLAN: r0=276(x1), r1=163(y1), r2=179(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=209(y), r7=10(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x), r11=111(y), r12=77(width), r13=47(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 163
LDI r2, 179
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 209
LDI r7, 10
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 111
LDI r12, 77
LDI r13, 47
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
