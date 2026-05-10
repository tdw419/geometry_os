; DESCRIPTION: Composite: Places a black line segment connecting (450, 183) to (485, 122) then Creates a black circular shape at (307, 114) with radius 77 then Creates a magenta rectangular region at (68, 82) spanning 21 by 100 pixels.
; PLAN: r0=450(x1), r1=183(y1), r2=485(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=114(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=82(y), r12=21(width), r13=100(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 183
LDI r2, 485
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 114
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 82
LDI r12, 21
LDI r13, 100
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
