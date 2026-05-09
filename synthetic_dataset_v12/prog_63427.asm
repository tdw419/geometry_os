; DESCRIPTION: Composite: Sets a single yellow pixel at (6, 127) then Creates a purple circular shape at (61, 196) with radius 33 then Draws a green line from (323, 140) to (74, 101).
; PLAN: r0=6(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=196(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=323(x1), r11=140(y1), r12=74(x2), r13=101(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 127
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 61
LDI r6, 196
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 323
LDI r11, 140
LDI r12, 74
LDI r13, 101
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
