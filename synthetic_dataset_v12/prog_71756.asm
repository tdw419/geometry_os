; DESCRIPTION: Composite: Places a magenta line segment connecting (435, 122) to (51, 17) then Creates a orange rectangular region at (317, 238) spanning 90 by 13 pixels.
; PLAN: r0=435(x1), r1=122(y1), r2=51(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=238(y), r7=90(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 122
LDI r2, 51
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 238
LDI r7, 90
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
