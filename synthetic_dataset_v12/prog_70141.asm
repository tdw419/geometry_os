; DESCRIPTION: Draws a white line from (350, 15) to (158, 204).
; PLAN: r0=350(x1), r1=15(y1), r2=158(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 15
LDI r2, 158
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
