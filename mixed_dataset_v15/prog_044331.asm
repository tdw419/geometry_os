; DESCRIPTION: Composite: Places a white dot at position (377, 124) then Places a orange line segment connecting (384, 143) to (339, 4).
; PLAN: r0=377(x), r1=124(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=384(x1), r6=143(y1), r7=339(x2), r8=4(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 124
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 143
LDI r7, 339
LDI r8, 4
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
