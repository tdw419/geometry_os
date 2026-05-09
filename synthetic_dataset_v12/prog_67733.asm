; DESCRIPTION: Composite: Places a purple dot at position (417, 218) then Draws a purple circle centered at (202, 148) with radius 57 then Renders a red line between points (241, 123) and (494, 117).
; PLAN: r0=417(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=148(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x1), r11=123(y1), r12=494(x2), r13=117(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 148
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 123
LDI r12, 494
LDI r13, 117
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
