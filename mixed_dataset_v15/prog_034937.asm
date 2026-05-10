; DESCRIPTION: Composite: Draws a white line from (358, 209) to (404, 244) then Sets a single green pixel at (270, 135) then Draws a yellow rectangle at (359, 172) with width 78 and height 81.
; PLAN: r0=358(x1), r1=209(y1), r2=404(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=135(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=359(x), r11=172(y), r12=78(width), r13=81(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 209
LDI r2, 404
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 135
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 359
LDI r11, 172
LDI r12, 78
LDI r13, 81
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
