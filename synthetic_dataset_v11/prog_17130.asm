; DESCRIPTION: Draws a white line from (87, 84) to (247, 77).
; PLAN: r0=87(x1), r1=84(y1), r2=247(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 84
LDI r2, 247
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
