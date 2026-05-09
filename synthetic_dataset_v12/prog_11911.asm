; DESCRIPTION: Composite: Draws a orange line from (299, 126) to (303, 11) then Sets a single yellow pixel at (110, 155) then Renders a red box of size 24x10 starting at (280, 123).
; PLAN: r0=299(x1), r1=126(y1), r2=303(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=155(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=280(x), r11=123(y), r12=24(width), r13=10(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 126
LDI r2, 303
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 155
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 280
LDI r11, 123
LDI r12, 24
LDI r13, 10
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
