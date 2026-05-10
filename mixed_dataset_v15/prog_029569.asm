; DESCRIPTION: Composite: Places a blue dot at position (237, 58) then Draws a red line from (146, 192) to (490, 15).
; PLAN: r0=237(x), r1=58(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=146(x1), r6=192(y1), r7=490(x2), r8=15(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 58
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 192
LDI r7, 490
LDI r8, 15
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
