; DESCRIPTION: Draws a white line from (75, 113) to (216, 185).
; PLAN: r0=75(x1), r1=113(y1), r2=216(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 113
LDI r2, 216
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
