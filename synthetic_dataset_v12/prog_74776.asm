; DESCRIPTION: Draws a white line from (208, 0) to (140, 217).
; PLAN: r0=208(x1), r1=0(y1), r2=140(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 0
LDI r2, 140
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
