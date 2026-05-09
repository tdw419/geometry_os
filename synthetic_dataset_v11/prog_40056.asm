; DESCRIPTION: Draws a white line from (120, 76) to (76, 250).
; PLAN: r0=120(x1), r1=76(y1), r2=76(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 76
LDI r2, 76
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
