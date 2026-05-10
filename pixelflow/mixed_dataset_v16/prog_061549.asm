; DESCRIPTION: Composite: Sets a single yellow pixel at (328, 136) then Draws a red line from (462, 128) to (13, 234).
; PLAN: r0=328(x), r1=136(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=462(x1), r6=128(y1), r7=13(x2), r8=234(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 136
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 462
LDI r6, 128
LDI r7, 13
LDI r8, 234
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
