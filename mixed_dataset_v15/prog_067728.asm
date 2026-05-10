; DESCRIPTION: Composite: Renders a yellow line between points (303, 180) and (132, 38) then Sets a single magenta pixel at (259, 69).
; PLAN: r0=303(x1), r1=180(y1), r2=132(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=69(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 180
LDI r2, 132
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 69
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
