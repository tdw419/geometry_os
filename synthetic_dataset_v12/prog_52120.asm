; DESCRIPTION: Composite: Sets a single yellow pixel at (91, 162) then Draws a blue line from (81, 111) to (61, 100) then Renders a magenta box of size 105x88 starting at (237, 15).
; PLAN: r0=91(x), r1=162(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=81(x1), r6=111(y1), r7=61(x2), r8=100(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=15(y), r12=105(width), r13=88(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 162
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 81
LDI r6, 111
LDI r7, 61
LDI r8, 100
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 15
LDI r12, 105
LDI r13, 88
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
