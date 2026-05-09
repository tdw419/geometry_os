; DESCRIPTION: Composite: Renders a green box of size 28x102 starting at (330, 63) then Draws a black line from (21, 191) to (363, 19) then Creates a green circular shape at (237, 156) with radius 55.
; PLAN: r0=330(x), r1=63(y), r2=28(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=191(y1), r7=363(x2), r8=19(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=156(y), r12=55(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 63
LDI r2, 28
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 191
LDI r7, 363
LDI r8, 19
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 156
LDI r12, 55
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
