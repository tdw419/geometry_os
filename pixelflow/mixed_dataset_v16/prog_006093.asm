; DESCRIPTION: Composite: Sets a single magenta pixel at (234, 160) then Draws a white line from (436, 231) to (54, 123) then Renders a purple box of size 66x80 starting at (147, 153).
; PLAN: r0=234(x), r1=160(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=436(x1), r6=231(y1), r7=54(x2), r8=123(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=153(y), r12=66(width), r13=80(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 160
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 436
LDI r6, 231
LDI r7, 54
LDI r8, 123
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 153
LDI r12, 66
LDI r13, 80
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
