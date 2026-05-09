; DESCRIPTION: Composite: Creates a red rectangular region at (69, 98) spanning 79 by 59 pixels then Draws a magenta line from (104, 72) to (176, 120) then Draws a magenta circle centered at (133, 199) with radius 22.
; PLAN: r0=69(x), r1=98(y), r2=79(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x1), r6=72(y1), r7=176(x2), r8=120(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=133(x), r11=199(y), r12=22(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 98
LDI r2, 79
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 72
LDI r7, 176
LDI r8, 120
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 199
LDI r12, 22
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
