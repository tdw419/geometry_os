; DESCRIPTION: Draws a white line from (343, 102) to (269, 24).
; PLAN: r0=343(x1), r1=102(y1), r2=269(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 102
LDI r2, 269
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
