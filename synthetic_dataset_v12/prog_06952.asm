; DESCRIPTION: Composite: Sets a single red pixel at (485, 147) then Renders a black line between points (449, 28) and (312, 100) then Renders a purple box of size 36x18 starting at (472, 154).
; PLAN: r0=485(x), r1=147(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=449(x1), r6=28(y1), r7=312(x2), r8=100(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=472(x), r11=154(y), r12=36(width), r13=18(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 147
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 449
LDI r6, 28
LDI r7, 312
LDI r8, 100
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 154
LDI r12, 36
LDI r13, 18
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
