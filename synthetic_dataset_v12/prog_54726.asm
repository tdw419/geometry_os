; DESCRIPTION: Composite: Draws a orange circle centered at (221, 162) with radius 49 then Renders a magenta box of size 78x102 starting at (48, 31) then Draws a orange line from (500, 158) to (365, 196).
; PLAN: r0=221(x), r1=162(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=31(y), r7=78(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=500(x1), r11=158(y1), r12=365(x2), r13=196(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 162
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 31
LDI r7, 78
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 158
LDI r12, 365
LDI r13, 196
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
