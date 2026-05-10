; DESCRIPTION: Composite: Draws a cyan line from (191, 24) to (102, 5) then Sets a single magenta pixel at (131, 113) then Draws a yellow rectangle at (341, 145) with width 84 and height 56.
; PLAN: r0=191(x1), r1=24(y1), r2=102(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=113(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=341(x), r11=145(y), r12=84(width), r13=56(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 24
LDI r2, 102
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 113
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 341
LDI r11, 145
LDI r12, 84
LDI r13, 56
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
