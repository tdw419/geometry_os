; DESCRIPTION: Draws a white line from (194, 140) to (3, 231).
; PLAN: r0=194(x1), r1=140(y1), r2=3(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 140
LDI r2, 3
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
