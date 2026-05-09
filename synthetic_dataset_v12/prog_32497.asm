; DESCRIPTION: Composite: Renders a yellow disk with center (241, 184) and radius 54 then Places a blue line segment connecting (76, 122) to (489, 64) then Renders a orange box of size 64x55 starting at (141, 16).
; PLAN: r0=241(x), r1=184(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x1), r6=122(y1), r7=489(x2), r8=64(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=16(y), r12=64(width), r13=55(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 184
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 122
LDI r7, 489
LDI r8, 64
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 16
LDI r12, 64
LDI r13, 55
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
