; DESCRIPTION: Draws a white line from (5, 120) to (29, 79).
; PLAN: r0=5(x1), r1=120(y1), r2=29(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 120
LDI r2, 29
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
