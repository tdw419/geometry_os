; DESCRIPTION: Composite: Creates a purple rectangular region at (65, 124) spanning 46 by 53 pixels then Places a blue circle of radius 61 at center (436, 185) then Renders a blue line between points (352, 140) and (28, 127).
; PLAN: r0=65(x), r1=124(y), r2=46(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=185(y), r7=61(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x1), r11=140(y1), r12=28(x2), r13=127(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 124
LDI r2, 46
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 185
LDI r7, 61
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 140
LDI r12, 28
LDI r13, 127
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
