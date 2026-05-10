; DESCRIPTION: Draws a white line from (97, 57) to (103, 130).
; PLAN: r0=97(x1), r1=57(y1), r2=103(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 57
LDI r2, 103
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
