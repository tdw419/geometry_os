; DESCRIPTION: Composite: Places a blue circle of radius 18 at center (411, 29) then Draws a red line from (469, 28) to (283, 87) then Renders a magenta box of size 51x98 starting at (340, 86).
; PLAN: r0=411(x), r1=29(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x1), r6=28(y1), r7=283(x2), r8=87(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=86(y), r12=51(width), r13=98(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 29
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 28
LDI r7, 283
LDI r8, 87
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 86
LDI r12, 51
LDI r13, 98
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
