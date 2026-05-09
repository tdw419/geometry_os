; DESCRIPTION: Composite: Places a blue line segment connecting (13, 92) to (174, 236) then Creates a yellow circular shape at (204, 108) with radius 19 then Renders a cyan box of size 41x85 starting at (338, 104).
; PLAN: r0=13(x1), r1=92(y1), r2=174(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=108(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=104(y), r12=41(width), r13=85(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 92
LDI r2, 174
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 108
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 104
LDI r12, 41
LDI r13, 85
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
