; DESCRIPTION: Composite: Places a red circle of radius 77 at center (312, 153) then Draws a magenta line from (327, 124) to (236, 118) then Renders a orange box of size 25x50 starting at (273, 127).
; PLAN: r0=312(x), r1=153(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x1), r6=124(y1), r7=236(x2), r8=118(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=127(y), r12=25(width), r13=50(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 153
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 124
LDI r7, 236
LDI r8, 118
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 127
LDI r12, 25
LDI r13, 50
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
