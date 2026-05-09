; DESCRIPTION: Draws a white line from (98, 194) to (14, 163).
; PLAN: r0=98(x1), r1=194(y1), r2=14(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 194
LDI r2, 14
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
