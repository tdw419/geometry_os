; DESCRIPTION: Draws a white line from (262, 233) to (467, 2).
; PLAN: r0=262(x1), r1=233(y1), r2=467(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 233
LDI r2, 467
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
