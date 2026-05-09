; DESCRIPTION: Composite: Places a green dot at position (382, 11) then Draws a green line from (276, 235) to (341, 243).
; PLAN: r0=382(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=276(x1), r6=235(y1), r7=341(x2), r8=243(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 276
LDI r6, 235
LDI r7, 341
LDI r8, 243
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
