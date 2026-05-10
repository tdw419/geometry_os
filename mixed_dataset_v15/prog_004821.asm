; DESCRIPTION: Composite: Places a magenta line segment connecting (382, 111) to (504, 63) then Creates a black rectangular region at (298, 109) spanning 28 by 80 pixels then Renders a blue disk with center (241, 117) and radius 62.
; PLAN: r0=382(x1), r1=111(y1), r2=504(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=109(y), r7=28(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=117(y), r12=62(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 111
LDI r2, 504
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 109
LDI r7, 28
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 117
LDI r12, 62
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
