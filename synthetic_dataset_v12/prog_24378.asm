; DESCRIPTION: Draws a red line from (375, 233) to (98, 124).
; PLAN: r0=375(x1), r1=233(y1), r2=98(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 233
LDI r2, 98
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
