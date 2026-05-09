; DESCRIPTION: Composite: Draws a blue rectangle at (311, 36) with width 77 and height 80 then Creates a blue circular shape at (73, 53) with radius 50 then Draws a cyan line from (55, 229) to (507, 72).
; PLAN: r0=311(x), r1=36(y), r2=77(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=53(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x1), r11=229(y1), r12=507(x2), r13=72(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 36
LDI r2, 77
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 53
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 229
LDI r12, 507
LDI r13, 72
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
