; DESCRIPTION: Composite: Renders a magenta line between points (267, 149) and (319, 33) then Renders a purple box of size 17x90 starting at (0, 124) then Draws a white circle centered at (212, 86) with radius 73.
; PLAN: r0=267(x1), r1=149(y1), r2=319(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=124(y), r7=17(width), r8=90(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=212(x), r11=86(y), r12=73(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 149
LDI r2, 319
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 124
LDI r7, 17
LDI r8, 90
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 86
LDI r12, 73
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
