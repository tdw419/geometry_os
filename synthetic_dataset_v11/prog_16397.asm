; DESCRIPTION: Draws a white line from (119, 102) to (82, 58).
; PLAN: r0=119(x1), r1=102(y1), r2=82(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 102
LDI r2, 82
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
