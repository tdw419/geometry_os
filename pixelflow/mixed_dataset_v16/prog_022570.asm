; DESCRIPTION: Composite: Sets a single purple pixel at (198, 124) then Renders a orange line between points (331, 117) and (274, 164).
; PLAN: r0=198(x), r1=124(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=117(y1), r7=274(x2), r8=164(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 124
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 117
LDI r7, 274
LDI r8, 164
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
