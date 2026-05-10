; DESCRIPTION: Draws a white line from (274, 83) to (31, 175).
; PLAN: r0=274(x1), r1=83(y1), r2=31(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 83
LDI r2, 31
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
