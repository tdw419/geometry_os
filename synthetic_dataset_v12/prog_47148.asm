; DESCRIPTION: Draws a white line from (262, 114) to (89, 39).
; PLAN: r0=262(x1), r1=114(y1), r2=89(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 114
LDI r2, 89
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
