; DESCRIPTION: Draws a white line from (99, 64) to (359, 156).
; PLAN: r0=99(x1), r1=64(y1), r2=359(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 64
LDI r2, 359
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
