; DESCRIPTION: Renders a white line between points (304, 18) and (467, 5).
; PLAN: r0=304(x1), r1=18(y1), r2=467(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 18
LDI r2, 467
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
