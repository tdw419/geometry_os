; DESCRIPTION: Composite: Places a cyan circle of radius 14 at center (406, 49) then Places a black line segment connecting (373, 19) to (204, 255) then Renders a blue box of size 70x73 starting at (261, 150).
; PLAN: r0=406(x), r1=49(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x1), r6=19(y1), r7=204(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=150(y), r12=70(width), r13=73(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 49
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 19
LDI r7, 204
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 150
LDI r12, 70
LDI r13, 73
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
