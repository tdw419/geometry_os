; DESCRIPTION: Composite: Draws a yellow circle centered at (419, 59) with radius 27 then Draws a purple line from (29, 102) to (394, 185).
; PLAN: r0=419(x), r1=59(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=102(y1), r7=394(x2), r8=185(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 59
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 102
LDI r7, 394
LDI r8, 185
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
