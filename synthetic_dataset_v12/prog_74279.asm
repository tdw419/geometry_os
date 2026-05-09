; DESCRIPTION: Composite: Draws a blue line from (355, 107) to (303, 66) then Creates a green circular shape at (62, 66) with radius 56.
; PLAN: r0=355(x1), r1=107(y1), r2=303(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=66(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 107
LDI r2, 303
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 66
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
