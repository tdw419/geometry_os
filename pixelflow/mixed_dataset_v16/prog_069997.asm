; DESCRIPTION: Composite: Sets a single magenta pixel at (107, 63) then Renders a yellow line between points (49, 218) and (81, 132).
; PLAN: r0=107(x), r1=63(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=49(x1), r6=218(y1), r7=81(x2), r8=132(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 63
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 218
LDI r7, 81
LDI r8, 132
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
