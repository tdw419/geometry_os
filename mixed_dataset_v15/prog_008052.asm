; DESCRIPTION: Composite: Creates a magenta rectangular region at (342, 130) spanning 96 by 79 pixels then Draws a orange line from (322, 120) to (94, 27) then Draws a magenta circle centered at (110, 157) with radius 31.
; PLAN: r0=342(x), r1=130(y), r2=96(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x1), r6=120(y1), r7=94(x2), r8=27(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=110(x), r11=157(y), r12=31(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 342
LDI r1, 130
LDI r2, 96
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 120
LDI r7, 94
LDI r8, 27
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 157
LDI r12, 31
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
