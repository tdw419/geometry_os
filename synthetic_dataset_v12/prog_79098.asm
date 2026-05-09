; DESCRIPTION: Composite: Renders a green line between points (70, 49) and (464, 206) then Creates a green rectangular region at (342, 21) spanning 27 by 78 pixels then Renders a green disk with center (124, 134) and radius 66.
; PLAN: r0=70(x1), r1=49(y1), r2=464(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=21(y), r7=27(width), r8=78(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=134(y), r12=66(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 70
LDI r1, 49
LDI r2, 464
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 21
LDI r7, 27
LDI r8, 78
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 134
LDI r12, 66
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
