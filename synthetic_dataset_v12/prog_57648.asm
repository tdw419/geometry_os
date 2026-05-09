; DESCRIPTION: Composite: Draws a cyan rectangle at (348, 41) with width 80 and height 112 then Sets a single magenta pixel at (98, 133) then Renders a blue line between points (335, 7) and (484, 87).
; PLAN: r0=348(x), r1=41(y), r2=80(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=133(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=335(x1), r11=7(y1), r12=484(x2), r13=87(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 41
LDI r2, 80
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 133
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 335
LDI r11, 7
LDI r12, 484
LDI r13, 87
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
