; DESCRIPTION: Composite: Renders a red disk with center (401, 211) and radius 44 then Draws a magenta rectangle at (43, 178) with width 18 and height 30 then Draws a purple line from (363, 196) to (320, 81).
; PLAN: r0=401(x), r1=211(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=178(y), r7=18(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x1), r11=196(y1), r12=320(x2), r13=81(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 211
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 178
LDI r7, 18
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 196
LDI r12, 320
LDI r13, 81
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
