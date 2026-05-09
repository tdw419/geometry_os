; DESCRIPTION: Draws a white line from (233, 217) to (153, 175).
; PLAN: r0=233(x1), r1=217(y1), r2=153(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 217
LDI r2, 153
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
