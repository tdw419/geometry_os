; DESCRIPTION: Draws a white line from (105, 7) to (149, 182).
; PLAN: r0=105(x1), r1=7(y1), r2=149(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 7
LDI r2, 149
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
