; DESCRIPTION: Draws a white line from (24, 34) to (81, 24).
; PLAN: r0=24(x1), r1=34(y1), r2=81(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 34
LDI r2, 81
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
