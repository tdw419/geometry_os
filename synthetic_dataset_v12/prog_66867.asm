; DESCRIPTION: Composite: Sets a single cyan pixel at (6, 22) then Draws a purple line from (283, 189) to (400, 167).
; PLAN: r0=6(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=189(y1), r7=400(x2), r8=167(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 22
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 189
LDI r7, 400
LDI r8, 167
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
