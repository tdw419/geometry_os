; DESCRIPTION: Composite: Sets a single blue pixel at (206, 175) then Draws a red line from (271, 64) to (437, 114).
; PLAN: r0=206(x), r1=175(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=64(y1), r7=437(x2), r8=114(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 175
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 64
LDI r7, 437
LDI r8, 114
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
