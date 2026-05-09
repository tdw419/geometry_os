; DESCRIPTION: Composite: Renders a green box of size 66x44 starting at (169, 77) then Renders a yellow line between points (53, 60) and (70, 71) then Draws a red circle centered at (255, 161) with radius 53.
; PLAN: r0=169(x), r1=77(y), r2=66(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x1), r6=60(y1), r7=70(x2), r8=71(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=161(y), r12=53(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 169
LDI r1, 77
LDI r2, 66
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 60
LDI r7, 70
LDI r8, 71
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 161
LDI r12, 53
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
