; DESCRIPTION: Draws a white line from (81, 6) to (353, 140).
; PLAN: r0=81(x1), r1=6(y1), r2=353(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 6
LDI r2, 353
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
