; DESCRIPTION: Composite: Places a yellow dot at position (30, 74) then Draws a yellow line from (423, 37) to (299, 43).
; PLAN: r0=30(x), r1=74(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=423(x1), r6=37(y1), r7=299(x2), r8=43(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 74
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 423
LDI r6, 37
LDI r7, 299
LDI r8, 43
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
