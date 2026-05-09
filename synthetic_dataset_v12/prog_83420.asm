; DESCRIPTION: Composite: Sets a single magenta pixel at (450, 219) then Renders a yellow line between points (45, 206) and (14, 43).
; PLAN: r0=450(x), r1=219(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=206(y1), r7=14(x2), r8=43(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 450
LDI r1, 219
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 206
LDI r7, 14
LDI r8, 43
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
