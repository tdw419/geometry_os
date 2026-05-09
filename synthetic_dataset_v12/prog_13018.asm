; DESCRIPTION: Composite: Places a orange line segment connecting (426, 150) to (268, 89) then Places a white dot at position (415, 169).
; PLAN: r0=426(x1), r1=150(y1), r2=268(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=169(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 150
LDI r2, 268
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 169
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
