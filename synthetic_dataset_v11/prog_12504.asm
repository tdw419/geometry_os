; DESCRIPTION: Draws a white line from (52, 68) to (56, 232).
; PLAN: r0=52(x1), r1=68(y1), r2=56(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 68
LDI r2, 56
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
