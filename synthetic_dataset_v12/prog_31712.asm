; DESCRIPTION: Draws a white line from (44, 83) to (188, 7).
; PLAN: r0=44(x1), r1=83(y1), r2=188(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 83
LDI r2, 188
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
