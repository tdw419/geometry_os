; DESCRIPTION: Composite: Places a black dot at position (499, 122) then Renders a yellow line between points (493, 154) and (408, 37).
; PLAN: r0=499(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=154(y1), r7=408(x2), r8=37(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 122
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 493
LDI r6, 154
LDI r7, 408
LDI r8, 37
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
