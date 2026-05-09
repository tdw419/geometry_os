; DESCRIPTION: Composite: Renders a orange line between points (271, 69) and (70, 254) then Renders a orange box of size 85x44 starting at (32, 88) then Draws a yellow circle centered at (378, 32) with radius 12.
; PLAN: r0=271(x1), r1=69(y1), r2=70(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=88(y), r7=85(width), r8=44(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x), r11=32(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 69
LDI r2, 70
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 88
LDI r7, 85
LDI r8, 44
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 32
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
