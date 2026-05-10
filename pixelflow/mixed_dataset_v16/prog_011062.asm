; DESCRIPTION: Composite: Draws a blue line from (386, 153) to (106, 109) then Creates a cyan circular shape at (206, 105) with radius 44 then Draws a red rectangle at (282, 73) with width 110 and height 113.
; PLAN: r0=386(x1), r1=153(y1), r2=106(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=105(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x), r11=73(y), r12=110(width), r13=113(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 153
LDI r2, 106
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 105
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 73
LDI r12, 110
LDI r13, 113
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
