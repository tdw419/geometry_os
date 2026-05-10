; DESCRIPTION: Composite: Places a white line segment connecting (396, 124) to (62, 64) then Places a white dot at position (99, 109).
; PLAN: r0=396(x1), r1=124(y1), r2=62(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=109(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 124
LDI r2, 62
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 109
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
