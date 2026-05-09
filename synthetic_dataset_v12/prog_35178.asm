; DESCRIPTION: Composite: Creates a magenta circular shape at (227, 140) with radius 51 then Draws a purple line from (354, 36) to (292, 50).
; PLAN: r0=227(x), r1=140(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x1), r6=36(y1), r7=292(x2), r8=50(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 140
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 36
LDI r7, 292
LDI r8, 50
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
