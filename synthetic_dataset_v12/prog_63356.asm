; DESCRIPTION: Composite: Sets a single blue pixel at (281, 125) then Renders a white line between points (383, 138) and (339, 49).
; PLAN: r0=281(x), r1=125(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=383(x1), r6=138(y1), r7=339(x2), r8=49(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 125
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 383
LDI r6, 138
LDI r7, 339
LDI r8, 49
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
