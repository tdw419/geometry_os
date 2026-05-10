; DESCRIPTION: Composite: Sets a single red pixel at (363, 92) then Draws a black line from (485, 128) to (392, 153) then Draws a purple rectangle at (368, 150) with width 119 and height 47.
; PLAN: r0=363(x), r1=92(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=128(y1), r7=392(x2), r8=153(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=150(y), r12=119(width), r13=47(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 92
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 485
LDI r6, 128
LDI r7, 392
LDI r8, 153
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 150
LDI r12, 119
LDI r13, 47
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
