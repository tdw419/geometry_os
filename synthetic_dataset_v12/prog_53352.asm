; DESCRIPTION: Composite: Renders a magenta line between points (139, 126) and (243, 179) then Creates a orange circular shape at (330, 72) with radius 33 then Draws a blue rectangle at (393, 102) with width 79 and height 112.
; PLAN: r0=139(x1), r1=126(y1), r2=243(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=72(y), r7=33(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=393(x), r11=102(y), r12=79(width), r13=112(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 126
LDI r2, 243
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 72
LDI r7, 33
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 393
LDI r11, 102
LDI r12, 79
LDI r13, 112
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
