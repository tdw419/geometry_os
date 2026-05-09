; DESCRIPTION: Composite: Draws a black rectangle at (248, 111) with width 33 and height 105 then Creates a cyan circular shape at (162, 106) with radius 53 then Renders a red line between points (392, 213) and (71, 96).
; PLAN: r0=248(x), r1=111(y), r2=33(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=106(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=392(x1), r11=213(y1), r12=71(x2), r13=96(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 111
LDI r2, 33
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 106
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 392
LDI r11, 213
LDI r12, 71
LDI r13, 96
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
