; DESCRIPTION: Composite: Renders a purple line between points (63, 117) and (108, 48) then Renders a green box of size 105x27 starting at (294, 194) then Draws a red circle centered at (184, 94) with radius 79.
; PLAN: r0=63(x1), r1=117(y1), r2=108(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=194(y), r7=105(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x), r11=94(y), r12=79(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 63
LDI r1, 117
LDI r2, 108
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 194
LDI r7, 105
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 94
LDI r12, 79
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
