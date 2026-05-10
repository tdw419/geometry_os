; DESCRIPTION: Composite: Renders a cyan box of size 35x11 starting at (349, 78) then Renders a black disk with center (173, 219) and radius 13 then Places a orange line segment connecting (428, 66) to (60, 208).
; PLAN: r0=349(x), r1=78(y), r2=35(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x), r6=219(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=428(x1), r11=66(y1), r12=60(x2), r13=208(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 78
LDI r2, 35
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 219
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 428
LDI r11, 66
LDI r12, 60
LDI r13, 208
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
