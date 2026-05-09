; DESCRIPTION: Composite: Places a red line segment connecting (407, 224) to (319, 78) then Places a magenta circle of radius 56 at center (245, 197).
; PLAN: r0=407(x1), r1=224(y1), r2=319(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=197(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 224
LDI r2, 319
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 197
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
