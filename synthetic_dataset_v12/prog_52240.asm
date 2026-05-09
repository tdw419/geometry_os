; DESCRIPTION: Composite: Sets a single black pixel at (145, 88) then Renders a yellow line between points (357, 72) and (326, 56).
; PLAN: r0=145(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=357(x1), r6=72(y1), r7=326(x2), r8=56(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 357
LDI r6, 72
LDI r7, 326
LDI r8, 56
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
