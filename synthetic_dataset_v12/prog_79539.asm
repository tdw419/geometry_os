; DESCRIPTION: Composite: Places a white 45x90 rectangle at position (212, 116) then Renders a white line between points (145, 86) and (492, 88) then Renders a purple disk with center (291, 112) and radius 59.
; PLAN: r0=212(x), r1=116(y), r2=45(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x1), r6=86(y1), r7=492(x2), r8=88(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=291(x), r11=112(y), r12=59(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 116
LDI r2, 45
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 86
LDI r7, 492
LDI r8, 88
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 112
LDI r12, 59
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
