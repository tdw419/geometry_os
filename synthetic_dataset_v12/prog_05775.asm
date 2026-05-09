; DESCRIPTION: Composite: Places a blue line segment connecting (28, 23) to (359, 127) then Sets a single green pixel at (152, 60) then Draws a black rectangle at (9, 53) with width 11 and height 120.
; PLAN: r0=28(x1), r1=23(y1), r2=359(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=60(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=9(x), r11=53(y), r12=11(width), r13=120(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 23
LDI r2, 359
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 60
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 9
LDI r11, 53
LDI r12, 11
LDI r13, 120
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
