; DESCRIPTION: Composite: Creates a red rectangular region at (448, 36) spanning 49 by 69 pixels then Places a yellow dot at position (2, 135) then Renders a blue line between points (492, 56) and (493, 163).
; PLAN: r0=448(x), r1=36(y), r2=49(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x), r6=135(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=492(x1), r11=56(y1), r12=493(x2), r13=163(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 36
LDI r2, 49
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 135
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 492
LDI r11, 56
LDI r12, 493
LDI r13, 163
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
