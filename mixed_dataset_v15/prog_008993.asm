; DESCRIPTION: Composite: Places a red dot at position (262, 124) then Places a white line segment connecting (26, 50) to (381, 184).
; PLAN: r0=262(x), r1=124(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=26(x1), r6=50(y1), r7=381(x2), r8=184(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 124
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 26
LDI r6, 50
LDI r7, 381
LDI r8, 184
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
