; DESCRIPTION: Composite: Places a black dot at position (412, 2) then Draws a black line from (282, 85) to (246, 196).
; PLAN: r0=412(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=282(x1), r6=85(y1), r7=246(x2), r8=196(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 282
LDI r6, 85
LDI r7, 246
LDI r8, 196
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
