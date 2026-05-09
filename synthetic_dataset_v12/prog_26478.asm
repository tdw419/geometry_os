; DESCRIPTION: Draws a white line from (270, 97) to (457, 48).
; PLAN: r0=270(x1), r1=97(y1), r2=457(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 97
LDI r2, 457
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
