; DESCRIPTION: Composite: Sets a single yellow pixel at (191, 67) then Renders a orange line between points (213, 163) and (282, 233).
; PLAN: r0=191(x), r1=67(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=213(x1), r6=163(y1), r7=282(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 67
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 213
LDI r6, 163
LDI r7, 282
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
