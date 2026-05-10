; DESCRIPTION: Draws a yellow line from (415, 61) to (276, 136).
; PLAN: r0=415(x1), r1=61(y1), r2=276(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 61
LDI r2, 276
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
