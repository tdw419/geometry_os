; DESCRIPTION: Composite: Draws a yellow circle centered at (376, 69) with radius 46 then Renders a magenta box of size 58x114 starting at (216, 50) then Renders a red line between points (71, 37) and (294, 112).
; PLAN: r0=376(x), r1=69(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=50(y), r7=58(width), r8=114(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x1), r11=37(y1), r12=294(x2), r13=112(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 69
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 50
LDI r7, 58
LDI r8, 114
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 37
LDI r12, 294
LDI r13, 112
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
