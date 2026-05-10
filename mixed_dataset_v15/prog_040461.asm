; DESCRIPTION: Composite: Places a purple dot at position (115, 79) then Draws a magenta line from (92, 208) to (181, 167).
; PLAN: r0=115(x), r1=79(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=92(x1), r6=208(y1), r7=181(x2), r8=167(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 79
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 208
LDI r7, 181
LDI r8, 167
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
