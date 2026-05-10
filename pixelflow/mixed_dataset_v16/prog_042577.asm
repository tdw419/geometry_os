; DESCRIPTION: Composite: Creates a black circular shape at (66, 87) with radius 18 then Renders a yellow line between points (349, 120) and (398, 149) then Creates a purple rectangular region at (205, 66) spanning 93 by 43 pixels.
; PLAN: r0=66(x), r1=87(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=120(y1), r7=398(x2), r8=149(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=66(y), r12=93(width), r13=43(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 87
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 120
LDI r7, 398
LDI r8, 149
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 66
LDI r12, 93
LDI r13, 43
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
