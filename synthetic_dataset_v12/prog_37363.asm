; DESCRIPTION: Composite: Places a blue line segment connecting (456, 114) to (30, 79) then Draws a white circle centered at (182, 168) with radius 71 then Creates a yellow rectangular region at (60, 67) spanning 109 by 100 pixels.
; PLAN: r0=456(x1), r1=114(y1), r2=30(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=168(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x), r11=67(y), r12=109(width), r13=100(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 114
LDI r2, 30
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 168
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 67
LDI r12, 109
LDI r13, 100
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
