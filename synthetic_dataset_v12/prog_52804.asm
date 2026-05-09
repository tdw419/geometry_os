; DESCRIPTION: Composite: Renders a purple box of size 62x13 starting at (200, 44) then Renders a purple line between points (462, 86) and (120, 18) then Renders a white disk with center (268, 150) and radius 67.
; PLAN: r0=200(x), r1=44(y), r2=62(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x1), r6=86(y1), r7=120(x2), r8=18(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=268(x), r11=150(y), r12=67(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 44
LDI r2, 62
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 86
LDI r7, 120
LDI r8, 18
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 150
LDI r12, 67
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
