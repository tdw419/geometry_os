; DESCRIPTION: Composite: Places a cyan line segment connecting (327, 79) to (138, 18) then Creates a yellow rectangular region at (59, 113) spanning 64 by 120 pixels then Draws a magenta circle centered at (88, 74) with radius 46.
; PLAN: r0=327(x1), r1=79(y1), r2=138(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=113(y), r7=64(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=74(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 79
LDI r2, 138
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 113
LDI r7, 64
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 74
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
