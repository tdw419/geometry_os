; DESCRIPTION: Composite: Places a white dot at position (414, 169) then Draws a black line from (499, 45) to (18, 37).
; PLAN: r0=414(x), r1=169(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=499(x1), r6=45(y1), r7=18(x2), r8=37(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 169
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 499
LDI r6, 45
LDI r7, 18
LDI r8, 37
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
