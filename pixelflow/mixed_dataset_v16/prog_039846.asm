; DESCRIPTION: Composite: Places a purple dot at position (247, 188) then Draws a yellow line from (207, 244) to (388, 167).
; PLAN: r0=247(x), r1=188(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=207(x1), r6=244(y1), r7=388(x2), r8=167(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 188
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 244
LDI r7, 388
LDI r8, 167
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
