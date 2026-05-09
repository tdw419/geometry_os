; DESCRIPTION: Draws a white line from (102, 78) to (35, 82).
; PLAN: r0=102(x1), r1=78(y1), r2=35(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 78
LDI r2, 35
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
