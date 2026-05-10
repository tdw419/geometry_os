; DESCRIPTION: Composite: Renders a cyan line between points (211, 194) and (344, 131) then Creates a yellow circular shape at (177, 219) with radius 10 then Renders a yellow box of size 89x84 starting at (85, 35).
; PLAN: r0=211(x1), r1=194(y1), r2=344(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=219(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=85(x), r11=35(y), r12=89(width), r13=84(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 194
LDI r2, 344
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 219
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 85
LDI r11, 35
LDI r12, 89
LDI r13, 84
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
