; DESCRIPTION: Composite: Renders a white line between points (64, 132) and (47, 154) then Creates a orange rectangular region at (117, 94) spanning 30 by 15 pixels then Renders a magenta disk with center (435, 70) and radius 16.
; PLAN: r0=64(x1), r1=132(y1), r2=47(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=94(y), r7=30(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=70(y), r12=16(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 132
LDI r2, 47
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 94
LDI r7, 30
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 70
LDI r12, 16
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
