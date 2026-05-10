; DESCRIPTION: Composite: Renders a cyan box of size 92x16 starting at (180, 101) then Places a purple circle of radius 55 at center (450, 113) then Places a orange line segment connecting (315, 99) to (308, 59).
; PLAN: r0=180(x), r1=101(y), r2=92(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=113(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x1), r11=99(y1), r12=308(x2), r13=59(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 101
LDI r2, 92
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 113
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 99
LDI r12, 308
LDI r13, 59
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
