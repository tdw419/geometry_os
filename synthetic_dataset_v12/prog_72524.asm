; DESCRIPTION: Draws a white line from (332, 90) to (462, 75).
; PLAN: r0=332(x1), r1=90(y1), r2=462(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 90
LDI r2, 462
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
