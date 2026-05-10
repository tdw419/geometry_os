; DESCRIPTION: Composite: Renders a green box of size 65x86 starting at (345, 147) then Creates a blue circular shape at (393, 54) with radius 38 then Renders a red line between points (468, 64) and (360, 149).
; PLAN: r0=345(x), r1=147(y), r2=65(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=54(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x1), r11=64(y1), r12=360(x2), r13=149(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 147
LDI r2, 65
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 54
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 64
LDI r12, 360
LDI r13, 149
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
