; DESCRIPTION: Composite: Draws a white circle centered at (248, 113) with radius 47 then Renders a blue line between points (101, 102) and (304, 186) then Renders a cyan box of size 20x51 starting at (143, 132).
; PLAN: r0=248(x), r1=113(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x1), r6=102(y1), r7=304(x2), r8=186(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=132(y), r12=20(width), r13=51(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 113
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 102
LDI r7, 304
LDI r8, 186
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 132
LDI r12, 20
LDI r13, 51
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
