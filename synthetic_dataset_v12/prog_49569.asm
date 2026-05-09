; DESCRIPTION: Draws a white line from (292, 70) to (362, 97).
; PLAN: r0=292(x1), r1=70(y1), r2=362(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 70
LDI r2, 362
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
