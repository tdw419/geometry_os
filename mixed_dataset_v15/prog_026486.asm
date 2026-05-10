; DESCRIPTION: Composite: Creates a white rectangular region at (126, 26) spanning 43 by 113 pixels then Renders a green disk with center (168, 169) and radius 80 then Draws a cyan line from (35, 29) to (227, 84).
; PLAN: r0=126(x), r1=26(y), r2=43(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=169(y), r7=80(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=35(x1), r11=29(y1), r12=227(x2), r13=84(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 26
LDI r2, 43
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 169
LDI r7, 80
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 35
LDI r11, 29
LDI r12, 227
LDI r13, 84
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
