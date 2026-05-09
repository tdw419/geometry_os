; DESCRIPTION: Composite: Draws a blue rectangle at (34, 154) with width 111 and height 73 then Sets a single black pixel at (80, 193) then Places a black line segment connecting (51, 109) to (61, 60).
; PLAN: r0=34(x), r1=154(y), r2=111(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x), r6=193(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=51(x1), r11=109(y1), r12=61(x2), r13=60(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 154
LDI r2, 111
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 193
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 51
LDI r11, 109
LDI r12, 61
LDI r13, 60
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
