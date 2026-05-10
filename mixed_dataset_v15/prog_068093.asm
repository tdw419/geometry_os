; DESCRIPTION: Composite: Creates a black circular shape at (267, 77) with radius 57 then Renders a magenta line between points (385, 171) and (209, 186) then Creates a black rectangular region at (243, 153) spanning 66 by 100 pixels.
; PLAN: r0=267(x), r1=77(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=171(y1), r7=209(x2), r8=186(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=153(y), r12=66(width), r13=100(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 77
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 171
LDI r7, 209
LDI r8, 186
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 153
LDI r12, 66
LDI r13, 100
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
