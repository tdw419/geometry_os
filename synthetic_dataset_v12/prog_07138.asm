; DESCRIPTION: Composite: Draws a blue rectangle at (227, 49) with width 56 and height 45 then Sets a single yellow pixel at (450, 76) then Places a yellow line segment connecting (377, 173) to (410, 80).
; PLAN: r0=227(x), r1=49(y), r2=56(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=76(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=377(x1), r11=173(y1), r12=410(x2), r13=80(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 49
LDI r2, 56
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 76
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 377
LDI r11, 173
LDI r12, 410
LDI r13, 80
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
