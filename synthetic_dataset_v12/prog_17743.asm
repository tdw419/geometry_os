; DESCRIPTION: Composite: Places a black line segment connecting (273, 7) to (109, 116) then Renders a orange box of size 33x56 starting at (258, 67) then Renders a magenta disk with center (404, 183) and radius 18.
; PLAN: r0=273(x1), r1=7(y1), r2=109(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=67(y), r7=33(width), r8=56(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x), r11=183(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 7
LDI r2, 109
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 67
LDI r7, 33
LDI r8, 56
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 183
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
