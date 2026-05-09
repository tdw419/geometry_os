; DESCRIPTION: Composite: Draws a magenta circle centered at (427, 72) with radius 35 then Renders a yellow box of size 23x24 starting at (20, 21) then Draws a red line from (215, 116) to (471, 84).
; PLAN: r0=427(x), r1=72(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=21(y), r7=23(width), r8=24(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x1), r11=116(y1), r12=471(x2), r13=84(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 72
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 21
LDI r7, 23
LDI r8, 24
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 116
LDI r12, 471
LDI r13, 84
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
