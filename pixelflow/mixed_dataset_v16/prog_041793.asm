; DESCRIPTION: Composite: Renders a purple box of size 78x76 starting at (108, 158) then Sets a single red pixel at (75, 120) then Renders a orange line between points (399, 224) and (218, 3).
; PLAN: r0=108(x), r1=158(y), r2=78(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=120(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=399(x1), r11=224(y1), r12=218(x2), r13=3(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 158
LDI r2, 78
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 120
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 399
LDI r11, 224
LDI r12, 218
LDI r13, 3
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
