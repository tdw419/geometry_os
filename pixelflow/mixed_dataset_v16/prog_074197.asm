; DESCRIPTION: Composite: Places a red 11x109 rectangle at position (405, 100) then Places a blue circle of radius 47 at center (288, 51) then Places a green line segment connecting (94, 114) to (493, 138).
; PLAN: r0=405(x), r1=100(y), r2=11(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=51(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=94(x1), r11=114(y1), r12=493(x2), r13=138(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 100
LDI r2, 11
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 51
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 94
LDI r11, 114
LDI r12, 493
LDI r13, 138
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
