; DESCRIPTION: Composite: Creates a blue circular shape at (326, 164) with radius 70 then Renders a yellow box of size 68x80 starting at (288, 97) then Renders a black line between points (126, 80) and (288, 51).
; PLAN: r0=326(x), r1=164(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=97(y), r7=68(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x1), r11=80(y1), r12=288(x2), r13=51(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 164
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 97
LDI r7, 68
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 80
LDI r12, 288
LDI r13, 51
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
