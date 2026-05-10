; DESCRIPTION: Composite: Renders a black line between points (124, 138) and (224, 130) then Creates a red circular shape at (400, 91) with radius 26.
; PLAN: r0=124(x1), r1=138(y1), r2=224(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=91(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 124
LDI r1, 138
LDI r2, 224
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 91
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
