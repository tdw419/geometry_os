; DESCRIPTION: Composite: Renders a purple box of size 61x79 starting at (178, 156) then Sets a single red pixel at (414, 208) then Places a blue line segment connecting (493, 249) to (52, 167).
; PLAN: r0=178(x), r1=156(y), r2=61(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=208(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=493(x1), r11=249(y1), r12=52(x2), r13=167(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 156
LDI r2, 61
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 208
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 493
LDI r11, 249
LDI r12, 52
LDI r13, 167
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
