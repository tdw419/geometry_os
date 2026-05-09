; DESCRIPTION: Composite: Renders a blue line between points (166, 3) and (405, 33) then Renders a white disk with center (132, 102) and radius 36.
; PLAN: r0=166(x1), r1=3(y1), r2=405(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=102(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 166
LDI r1, 3
LDI r2, 405
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 102
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
