; DESCRIPTION: Composite: Creates a magenta rectangular region at (243, 115) spanning 103 by 42 pixels then Places a black line segment connecting (430, 150) to (271, 152) then Draws a blue circle centered at (221, 138) with radius 54.
; PLAN: r0=243(x), r1=115(y), r2=103(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x1), r6=150(y1), r7=271(x2), r8=152(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=138(y), r12=54(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 115
LDI r2, 103
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 150
LDI r7, 271
LDI r8, 152
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 138
LDI r12, 54
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
