; DESCRIPTION: Composite: . Then Draws a black line from (190, 222) to (191, 77). Then Draws a green circle centered at (148, 57) with radius 12.
; PLAN: r0=190(x1), r1=222(y1), r2=191(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=148(x), r1=57(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (190, 222) to (191, 77).
; PLAN: r0=190(x1), r1=222(y1), r2=191(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 222
LDI r2, 191
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (148, 57) with radius 12.
; PLAN: r0=148(x), r1=57(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 57
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
