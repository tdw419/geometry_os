; DESCRIPTION: Composite: Places a blue line segment connecting (303, 4) to (37, 135) then Draws a purple circle centered at (416, 57) with radius 48 then Renders a purple box of size 75x68 starting at (37, 132).
; PLAN: r0=303(x1), r1=4(y1), r2=37(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=57(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=37(x), r11=132(y), r12=75(width), r13=68(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 4
LDI r2, 37
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 57
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 37
LDI r11, 132
LDI r12, 75
LDI r13, 68
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
