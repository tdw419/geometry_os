; DESCRIPTION: Composite: Places a black dot at position (359, 165) then Draws a red line from (439, 240) to (196, 33).
; PLAN: r0=359(x), r1=165(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=439(x1), r6=240(y1), r7=196(x2), r8=33(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 165
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 439
LDI r6, 240
LDI r7, 196
LDI r8, 33
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
