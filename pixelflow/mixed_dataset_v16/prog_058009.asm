; DESCRIPTION: Composite: Sets a single yellow pixel at (84, 94) then Draws a blue line from (278, 234) to (406, 176).
; PLAN: r0=84(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=234(y1), r7=406(x2), r8=176(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 94
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 234
LDI r7, 406
LDI r8, 176
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
