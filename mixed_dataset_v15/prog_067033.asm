; DESCRIPTION: Composite: Creates a orange rectangular region at (243, 34) spanning 117 by 105 pixels then Creates a cyan circular shape at (78, 149) with radius 62 then Renders a magenta line between points (453, 231) and (226, 63).
; PLAN: r0=243(x), r1=34(y), r2=117(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=149(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=453(x1), r11=231(y1), r12=226(x2), r13=63(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 34
LDI r2, 117
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 149
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 453
LDI r11, 231
LDI r12, 226
LDI r13, 63
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
