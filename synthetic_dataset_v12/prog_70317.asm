; DESCRIPTION: Composite: Renders a blue disk with center (476, 205) and radius 20 then Renders a purple line between points (243, 170) and (273, 184) then Renders a black box of size 25x10 starting at (190, 11).
; PLAN: r0=476(x), r1=205(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x1), r6=170(y1), r7=273(x2), r8=184(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=190(x), r11=11(y), r12=25(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 205
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 170
LDI r7, 273
LDI r8, 184
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 11
LDI r12, 25
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
