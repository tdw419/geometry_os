; DESCRIPTION: Draws a white line from (182, 189) to (101, 31).
; PLAN: r0=182(x1), r1=189(y1), r2=101(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 189
LDI r2, 101
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
