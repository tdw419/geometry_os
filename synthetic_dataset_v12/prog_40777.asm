; DESCRIPTION: Composite: Draws a cyan circle centered at (106, 69) with radius 44 then Renders a red box of size 77x100 starting at (322, 154) then Renders a orange line between points (267, 240) and (336, 35).
; PLAN: r0=106(x), r1=69(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=154(y), r7=77(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x1), r11=240(y1), r12=336(x2), r13=35(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 69
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 154
LDI r7, 77
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 240
LDI r12, 336
LDI r13, 35
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
