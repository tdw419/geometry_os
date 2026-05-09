; DESCRIPTION: Composite: Draws a green rectangle at (35, 136) with width 33 and height 27 then Draws a magenta line from (384, 17) to (173, 203).
; PLAN: r0=35(x), r1=136(y), r2=33(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x1), r6=17(y1), r7=173(x2), r8=203(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 136
LDI r2, 33
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 17
LDI r7, 173
LDI r8, 203
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
