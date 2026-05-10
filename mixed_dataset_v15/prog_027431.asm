; DESCRIPTION: Composite: Places a magenta circle of radius 57 at center (377, 59) then Draws a red line from (427, 98) to (256, 41) then Renders a purple box of size 106x37 starting at (329, 138).
; PLAN: r0=377(x), r1=59(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=98(y1), r7=256(x2), r8=41(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=138(y), r12=106(width), r13=37(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 59
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 98
LDI r7, 256
LDI r8, 41
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 138
LDI r12, 106
LDI r13, 37
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
