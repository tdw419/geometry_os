; DESCRIPTION: Composite: Places a magenta line segment connecting (167, 134) to (218, 57) then Renders a yellow disk with center (272, 147) and radius 41.
; PLAN: r0=167(x1), r1=134(y1), r2=218(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=147(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 167
LDI r1, 134
LDI r2, 218
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 147
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
