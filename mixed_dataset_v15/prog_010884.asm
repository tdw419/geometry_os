; DESCRIPTION: Draws a white line from (80, 80) to (382, 44).
; PLAN: r0=80(x1), r1=80(y1), r2=382(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 80
LDI r2, 382
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
