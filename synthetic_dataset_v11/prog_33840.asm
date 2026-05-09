; DESCRIPTION: Draws a white line from (183, 84) to (208, 78).
; PLAN: r0=183(x1), r1=84(y1), r2=208(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 84
LDI r2, 208
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
