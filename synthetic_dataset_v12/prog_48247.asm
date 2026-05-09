; DESCRIPTION: Composite: Renders a magenta box of size 20x49 starting at (363, 19) then Places a black line segment connecting (69, 92) to (293, 7) then Places a orange circle of radius 61 at center (443, 96).
; PLAN: r0=363(x), r1=19(y), r2=20(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x1), r6=92(y1), r7=293(x2), r8=7(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=96(y), r12=61(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 19
LDI r2, 20
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 92
LDI r7, 293
LDI r8, 7
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 96
LDI r12, 61
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
