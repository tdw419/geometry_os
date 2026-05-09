; DESCRIPTION: Composite: Renders a blue line between points (6, 147) and (302, 59) then Renders a cyan disk with center (343, 63) and radius 43.
; PLAN: r0=6(x1), r1=147(y1), r2=302(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=63(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 147
LDI r2, 302
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 63
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
