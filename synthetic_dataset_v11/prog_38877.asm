; DESCRIPTION: Draws a red line from (2, 87) to (217, 6).
; PLAN: r0=2(x1), r1=87(y1), r2=217(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 87
LDI r2, 217
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
