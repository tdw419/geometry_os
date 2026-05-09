; DESCRIPTION: Draws a white line from (40, 144) to (226, 15).
; PLAN: r0=40(x1), r1=144(y1), r2=226(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 144
LDI r2, 226
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
