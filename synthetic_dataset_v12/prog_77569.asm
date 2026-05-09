; DESCRIPTION: Composite: Draws a green rectangle at (113, 105) with width 111 and height 112 then Draws a red circle centered at (79, 163) with radius 50 then Places a cyan line segment connecting (409, 106) to (435, 229).
; PLAN: r0=113(x), r1=105(y), r2=111(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=163(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=409(x1), r11=106(y1), r12=435(x2), r13=229(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 105
LDI r2, 111
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 163
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 409
LDI r11, 106
LDI r12, 435
LDI r13, 229
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
