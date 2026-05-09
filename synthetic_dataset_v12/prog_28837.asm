; DESCRIPTION: Composite: Renders a orange line between points (291, 154) and (508, 137) then Places a purple 111x65 rectangle at position (108, 130) then Renders a white disk with center (133, 70) and radius 43.
; PLAN: r0=291(x1), r1=154(y1), r2=508(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=130(y), r7=111(width), r8=65(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=70(y), r12=43(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 154
LDI r2, 508
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 130
LDI r7, 111
LDI r8, 65
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 70
LDI r12, 43
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
