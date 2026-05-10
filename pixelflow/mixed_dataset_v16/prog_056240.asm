; DESCRIPTION: Composite: Draws a green rectangle at (342, 18) with width 15 and height 109 then Places a red circle of radius 62 at center (307, 145) then Draws a blue line from (53, 35) to (12, 210).
; PLAN: r0=342(x), r1=18(y), r2=15(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=145(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x1), r11=35(y1), r12=12(x2), r13=210(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 18
LDI r2, 15
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 145
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 35
LDI r12, 12
LDI r13, 210
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
