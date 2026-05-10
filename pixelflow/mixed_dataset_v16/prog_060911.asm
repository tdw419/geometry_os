; DESCRIPTION: Composite: Renders a red box of size 38x106 starting at (188, 62) then Renders a blue disk with center (394, 153) and radius 65 then Renders a purple line between points (240, 233) and (267, 64).
; PLAN: r0=188(x), r1=62(y), r2=38(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=153(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=240(x1), r11=233(y1), r12=267(x2), r13=64(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 62
LDI r2, 38
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 153
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 240
LDI r11, 233
LDI r12, 267
LDI r13, 64
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
