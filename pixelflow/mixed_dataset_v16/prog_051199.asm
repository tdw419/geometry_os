; DESCRIPTION: Composite: Draws a green line from (90, 112) to (460, 250) then Creates a orange rectangular region at (18, 30) spanning 82 by 14 pixels then Renders a green disk with center (349, 123) and radius 73.
; PLAN: r0=90(x1), r1=112(y1), r2=460(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=30(y), r7=82(width), r8=14(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=349(x), r11=123(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 112
LDI r2, 460
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 30
LDI r7, 82
LDI r8, 14
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 123
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
