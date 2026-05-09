; DESCRIPTION: Composite: Sets a single blue pixel at (157, 38) then Draws a black line from (107, 153) to (307, 66) then Renders a blue box of size 76x84 starting at (7, 37).
; PLAN: r0=157(x), r1=38(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=153(y1), r7=307(x2), r8=66(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=37(y), r12=76(width), r13=84(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 38
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 153
LDI r7, 307
LDI r8, 66
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 37
LDI r12, 76
LDI r13, 84
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
