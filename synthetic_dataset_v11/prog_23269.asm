; DESCRIPTION: Draws a white line from (56, 96) to (98, 136).
; PLAN: r0=56(x1), r1=96(y1), r2=98(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 96
LDI r2, 98
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
