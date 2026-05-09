; DESCRIPTION: Composite: Sets a single magenta pixel at (37, 47) then Draws a white line from (156, 15) to (499, 165).
; PLAN: r0=37(x), r1=47(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=156(x1), r6=15(y1), r7=499(x2), r8=165(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 47
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 15
LDI r7, 499
LDI r8, 165
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
