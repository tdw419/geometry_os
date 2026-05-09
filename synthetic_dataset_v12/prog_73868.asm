; DESCRIPTION: Composite: Creates a cyan circular shape at (159, 121) with radius 45 then Renders a magenta box of size 61x15 starting at (133, 44) then Places a orange line segment connecting (133, 230) to (112, 145).
; PLAN: r0=159(x), r1=121(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=44(y), r7=61(width), r8=15(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x1), r11=230(y1), r12=112(x2), r13=145(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 121
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 44
LDI r7, 61
LDI r8, 15
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 230
LDI r12, 112
LDI r13, 145
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
