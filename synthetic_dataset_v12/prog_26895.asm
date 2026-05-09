; DESCRIPTION: Composite: Places a orange dot at position (279, 124) then Creates a purple circular shape at (359, 74) with radius 30 then Renders a orange line between points (118, 228) and (265, 203).
; PLAN: r0=279(x), r1=124(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=74(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x1), r11=228(y1), r12=265(x2), r13=203(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 124
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 359
LDI r6, 74
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 228
LDI r12, 265
LDI r13, 203
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
