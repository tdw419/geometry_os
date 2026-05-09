; DESCRIPTION: Composite: Creates a cyan rectangular region at (396, 36) spanning 112 by 103 pixels then Renders a yellow disk with center (403, 106) and radius 60 then Renders a purple line between points (54, 205) and (280, 149).
; PLAN: r0=396(x), r1=36(y), r2=112(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=106(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=54(x1), r11=205(y1), r12=280(x2), r13=149(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 36
LDI r2, 112
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 106
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 54
LDI r11, 205
LDI r12, 280
LDI r13, 149
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
