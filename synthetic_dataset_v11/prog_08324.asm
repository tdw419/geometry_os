; DESCRIPTION: Draws a white line from (3, 138) to (10, 62).
; PLAN: r0=3(x1), r1=138(y1), r2=10(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 138
LDI r2, 10
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
