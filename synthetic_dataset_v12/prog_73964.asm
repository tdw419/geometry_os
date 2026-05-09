; DESCRIPTION: Composite: Renders a blue disk with center (266, 211) and radius 23 then Draws a magenta line from (466, 19) to (2, 101).
; PLAN: r0=266(x), r1=211(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x1), r6=19(y1), r7=2(x2), r8=101(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 211
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 19
LDI r7, 2
LDI r8, 101
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
