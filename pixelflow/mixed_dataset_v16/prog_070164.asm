; DESCRIPTION: Composite: Places a cyan dot at position (452, 101) then Draws a blue line from (235, 84) to (232, 49).
; PLAN: r0=452(x), r1=101(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=235(x1), r6=84(y1), r7=232(x2), r8=49(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 101
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 84
LDI r7, 232
LDI r8, 49
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
