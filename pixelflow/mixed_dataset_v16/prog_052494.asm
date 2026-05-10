; DESCRIPTION: Draws a white line from (220, 192) to (501, 100).
; PLAN: r0=220(x1), r1=192(y1), r2=501(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 192
LDI r2, 501
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
