; DESCRIPTION: Composite: Places a red circle of radius 32 at center (161, 88) then Places a green dot at position (147, 173) then Draws a magenta line from (424, 72) to (144, 7).
; PLAN: r0=161(x), r1=88(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=173(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=424(x1), r11=72(y1), r12=144(x2), r13=7(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 88
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 173
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 424
LDI r11, 72
LDI r12, 144
LDI r13, 7
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
