; DESCRIPTION: Composite: Sets a single purple pixel at (288, 119) then Draws a white line from (14, 99) to (16, 192).
; PLAN: r0=288(x), r1=119(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=99(y1), r7=16(x2), r8=192(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 119
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 14
LDI r6, 99
LDI r7, 16
LDI r8, 192
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
