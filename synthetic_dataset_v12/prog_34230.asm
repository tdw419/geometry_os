; DESCRIPTION: Composite: Sets a single orange pixel at (78, 147) then Renders a magenta line between points (271, 135) and (1, 13).
; PLAN: r0=78(x), r1=147(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=135(y1), r7=1(x2), r8=13(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 147
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 271
LDI r6, 135
LDI r7, 1
LDI r8, 13
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
