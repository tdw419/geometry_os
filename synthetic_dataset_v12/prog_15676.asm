; DESCRIPTION: Composite: Places a green line segment connecting (497, 32) to (478, 2) then Draws a yellow circle centered at (151, 136) with radius 77 then Renders a magenta box of size 102x116 starting at (303, 54).
; PLAN: r0=497(x1), r1=32(y1), r2=478(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=136(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=303(x), r11=54(y), r12=102(width), r13=116(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 32
LDI r2, 478
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 136
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 303
LDI r11, 54
LDI r12, 102
LDI r13, 116
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
