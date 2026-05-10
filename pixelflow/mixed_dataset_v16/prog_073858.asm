; DESCRIPTION: Draws a white line from (426, 30) to (127, 130).
; PLAN: r0=426(x1), r1=30(y1), r2=127(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 30
LDI r2, 127
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
