; DESCRIPTION: Composite: Places a blue dot at position (315, 166) then Draws a red line from (122, 207) to (312, 211).
; PLAN: r0=315(x), r1=166(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=207(y1), r7=312(x2), r8=211(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 166
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 207
LDI r7, 312
LDI r8, 211
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
