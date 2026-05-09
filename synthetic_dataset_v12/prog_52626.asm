; DESCRIPTION: Composite: Sets a single purple pixel at (20, 219) then Draws a green line from (509, 117) to (227, 147).
; PLAN: r0=20(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=117(y1), r7=227(x2), r8=147(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 509
LDI r6, 117
LDI r7, 227
LDI r8, 147
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
