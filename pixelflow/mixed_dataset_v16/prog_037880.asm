; DESCRIPTION: Composite: Draws a orange rectangle at (327, 100) with width 68 and height 32 then Places a orange circle of radius 44 at center (319, 202) then Places a blue line segment connecting (108, 181) to (392, 93).
; PLAN: r0=327(x), r1=100(y), r2=68(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=202(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=108(x1), r11=181(y1), r12=392(x2), r13=93(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 100
LDI r2, 68
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 202
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 108
LDI r11, 181
LDI r12, 392
LDI r13, 93
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
