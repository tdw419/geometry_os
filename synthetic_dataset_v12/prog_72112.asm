; DESCRIPTION: Composite: Renders a green line between points (253, 130) and (243, 44) then Creates a white circular shape at (138, 79) with radius 72.
; PLAN: r0=253(x1), r1=130(y1), r2=243(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=79(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 253
LDI r1, 130
LDI r2, 243
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 79
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
