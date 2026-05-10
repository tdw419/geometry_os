; DESCRIPTION: Composite: Creates a purple circular shape at (276, 81) with radius 52 then Renders a orange line between points (78, 134) and (245, 161) then Renders a purple box of size 22x99 starting at (220, 61).
; PLAN: r0=276(x), r1=81(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x1), r6=134(y1), r7=245(x2), r8=161(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=220(x), r11=61(y), r12=22(width), r13=99(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 81
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 134
LDI r7, 245
LDI r8, 161
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 61
LDI r12, 22
LDI r13, 99
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
