; DESCRIPTION: Composite: Places a blue dot at position (368, 232) then Draws a magenta line from (352, 155) to (335, 153).
; PLAN: r0=368(x), r1=232(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=352(x1), r6=155(y1), r7=335(x2), r8=153(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 232
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 155
LDI r7, 335
LDI r8, 153
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
