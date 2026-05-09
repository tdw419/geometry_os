; DESCRIPTION: Composite: Renders a magenta disk with center (460, 49) and radius 24 then Renders a orange box of size 99x52 starting at (363, 158) then Draws a orange line from (290, 211) to (475, 52).
; PLAN: r0=460(x), r1=49(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=158(y), r7=99(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x1), r11=211(y1), r12=475(x2), r13=52(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 460
LDI r1, 49
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 158
LDI r7, 99
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 211
LDI r12, 475
LDI r13, 52
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
