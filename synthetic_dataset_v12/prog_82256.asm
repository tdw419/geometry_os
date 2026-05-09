; DESCRIPTION: Composite: Draws a magenta circle centered at (195, 232) with radius 21 then Renders a red box of size 97x10 starting at (401, 192) then Renders a yellow line between points (78, 91) and (254, 11).
; PLAN: r0=195(x), r1=232(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=192(y), r7=97(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=78(x1), r11=91(y1), r12=254(x2), r13=11(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 232
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 192
LDI r7, 97
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 91
LDI r12, 254
LDI r13, 11
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
