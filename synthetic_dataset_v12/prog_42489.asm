; DESCRIPTION: Composite: Places a cyan dot at position (448, 2) then Draws a white line from (296, 59) to (238, 140).
; PLAN: r0=448(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=296(x1), r6=59(y1), r7=238(x2), r8=140(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 59
LDI r7, 238
LDI r8, 140
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
