; DESCRIPTION: Draws a white line from (350, 140) to (466, 74).
; PLAN: r0=350(x1), r1=140(y1), r2=466(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 140
LDI r2, 466
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
