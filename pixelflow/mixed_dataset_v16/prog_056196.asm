; DESCRIPTION: Composite: Draws a green line from (385, 234) to (329, 97) then Sets a single magenta pixel at (511, 101) then Renders a black box of size 13x85 starting at (474, 13).
; PLAN: r0=385(x1), r1=234(y1), r2=329(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=101(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=474(x), r11=13(y), r12=13(width), r13=85(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 234
LDI r2, 329
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 101
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 474
LDI r11, 13
LDI r12, 13
LDI r13, 85
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
