; DESCRIPTION: Composite: Creates a orange circular shape at (332, 90) with radius 33 then Draws a blue rectangle at (145, 204) with width 60 and height 31 then Draws a red line from (60, 215) to (431, 108).
; PLAN: r0=332(x), r1=90(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=204(y), r7=60(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x1), r11=215(y1), r12=431(x2), r13=108(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 90
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 204
LDI r7, 60
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 215
LDI r12, 431
LDI r13, 108
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
