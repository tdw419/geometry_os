; DESCRIPTION: Renders a white line between points (37, 97) and (112, 103).
; PLAN: r0=37(x1), r1=97(y1), r2=112(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 97
LDI r2, 112
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
