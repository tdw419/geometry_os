; DESCRIPTION: Composite: Renders a cyan line between points (256, 85) and (2, 186) then Renders a blue disk with center (308, 198) and radius 31 then Creates a white rectangular region at (160, 146) spanning 22 by 74 pixels.
; PLAN: r0=256(x1), r1=85(y1), r2=2(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=198(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x), r11=146(y), r12=22(width), r13=74(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 85
LDI r2, 2
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 198
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 146
LDI r12, 22
LDI r13, 74
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
