; DESCRIPTION: Composite: Draws a blue rectangle at (262, 15) with width 87 and height 114 then Draws a purple line from (405, 27) to (357, 72) then Creates a red circular shape at (285, 166) with radius 49.
; PLAN: r0=262(x), r1=15(y), r2=87(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x1), r6=27(y1), r7=357(x2), r8=72(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=166(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 262
LDI r1, 15
LDI r2, 87
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 27
LDI r7, 357
LDI r8, 72
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 166
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
