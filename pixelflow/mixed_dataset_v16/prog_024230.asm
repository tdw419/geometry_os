; DESCRIPTION: Composite: Draws a blue line from (27, 15) to (63, 78) then Places a purple circle of radius 56 at center (436, 79) then Places a orange 90x64 rectangle at position (92, 170).
; PLAN: r0=27(x1), r1=15(y1), r2=63(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=79(y), r7=56(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x), r11=170(y), r12=90(width), r13=64(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 15
LDI r2, 63
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 79
LDI r7, 56
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 170
LDI r12, 90
LDI r13, 64
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
