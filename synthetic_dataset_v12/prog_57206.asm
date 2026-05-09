; DESCRIPTION: Composite: Creates a yellow circular shape at (145, 229) with radius 15 then Places a purple dot at position (29, 74) then Renders a green line between points (268, 54) and (265, 20).
; PLAN: r0=145(x), r1=229(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=74(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=268(x1), r11=54(y1), r12=265(x2), r13=20(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 229
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 74
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 268
LDI r11, 54
LDI r12, 265
LDI r13, 20
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
