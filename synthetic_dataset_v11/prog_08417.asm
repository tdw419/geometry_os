; DESCRIPTION: Draws a white line from (210, 34) to (177, 36).
; PLAN: r0=210(x1), r1=34(y1), r2=177(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 34
LDI r2, 177
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
