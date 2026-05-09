; DESCRIPTION: Composite: Renders a yellow line between points (112, 68) and (111, 29) then Sets a single magenta pixel at (50, 54).
; PLAN: r0=112(x1), r1=68(y1), r2=111(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=54(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 68
LDI r2, 111
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 54
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
