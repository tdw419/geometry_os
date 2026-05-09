; DESCRIPTION: Composite: Sets a single yellow pixel at (493, 77) then Draws a purple line from (276, 232) to (488, 151) then Renders a yellow box of size 91x111 starting at (187, 2).
; PLAN: r0=493(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=276(x1), r6=232(y1), r7=488(x2), r8=151(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=2(y), r12=91(width), r13=111(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 276
LDI r6, 232
LDI r7, 488
LDI r8, 151
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 2
LDI r12, 91
LDI r13, 111
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
