; DESCRIPTION: Composite: Renders a blue line between points (87, 6) and (114, 185) then Renders a orange disk with center (208, 157) and radius 79 then Draws a red rectangle at (210, 214) with width 68 and height 34.
; PLAN: r0=87(x1), r1=6(y1), r2=114(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=157(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=214(y), r12=68(width), r13=34(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 6
LDI r2, 114
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 157
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 214
LDI r12, 68
LDI r13, 34
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
