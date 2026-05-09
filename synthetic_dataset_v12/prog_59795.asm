; DESCRIPTION: Draws a white line from (35, 113) to (462, 24).
; PLAN: r0=35(x1), r1=113(y1), r2=462(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 113
LDI r2, 462
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
