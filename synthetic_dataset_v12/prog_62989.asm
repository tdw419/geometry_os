; DESCRIPTION: Composite: Sets a single yellow pixel at (426, 74) then Draws a black line from (444, 65) to (152, 47).
; PLAN: r0=426(x), r1=74(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=444(x1), r6=65(y1), r7=152(x2), r8=47(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 74
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 444
LDI r6, 65
LDI r7, 152
LDI r8, 47
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
