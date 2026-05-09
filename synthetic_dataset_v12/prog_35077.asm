; DESCRIPTION: Composite: Renders a yellow line between points (72, 9) and (263, 19) then Creates a white circular shape at (25, 130) with radius 17.
; PLAN: r0=72(x1), r1=9(y1), r2=263(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=130(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 9
LDI r2, 263
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 130
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
