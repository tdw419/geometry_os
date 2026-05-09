; DESCRIPTION: Composite: Renders a cyan line between points (322, 172) and (123, 56) then Creates a yellow circular shape at (279, 116) with radius 17.
; PLAN: r0=322(x1), r1=172(y1), r2=123(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=116(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 172
LDI r2, 123
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 116
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
