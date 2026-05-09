; DESCRIPTION: Composite: Creates a yellow circular shape at (116, 33) with radius 27 then Draws a black rectangle at (60, 3) with width 51 and height 59 then Renders a black line between points (202, 155) and (412, 200).
; PLAN: r0=116(x), r1=33(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=3(y), r7=51(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x1), r11=155(y1), r12=412(x2), r13=200(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 33
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 3
LDI r7, 51
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 155
LDI r12, 412
LDI r13, 200
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
