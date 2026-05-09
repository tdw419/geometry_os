; DESCRIPTION: Composite: Draws a green line from (197, 110) to (28, 33) then Draws a blue rectangle at (404, 113) with width 59 and height 66 then Creates a purple circular shape at (256, 174) with radius 73.
; PLAN: r0=197(x1), r1=110(y1), r2=28(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=113(y), r7=59(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=174(y), r12=73(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 110
LDI r2, 28
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 113
LDI r7, 59
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 174
LDI r12, 73
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
