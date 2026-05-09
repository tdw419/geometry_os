; DESCRIPTION: Draws a red line from (47, 117) to (268, 72).
; PLAN: r0=47(x1), r1=117(y1), r2=268(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 117
LDI r2, 268
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
