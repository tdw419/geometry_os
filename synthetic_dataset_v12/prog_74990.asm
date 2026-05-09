; DESCRIPTION: Draws a white line from (61, 84) to (393, 144).
; PLAN: r0=61(x1), r1=84(y1), r2=393(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 84
LDI r2, 393
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
