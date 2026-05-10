; DESCRIPTION: Composite: Renders a black line between points (310, 144) and (352, 54) then Sets a single purple pixel at (90, 236) then Creates a purple rectangular region at (72, 88) spanning 80 by 48 pixels.
; PLAN: r0=310(x1), r1=144(y1), r2=352(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=236(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=72(x), r11=88(y), r12=80(width), r13=48(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 144
LDI r2, 352
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 236
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 72
LDI r11, 88
LDI r12, 80
LDI r13, 48
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
