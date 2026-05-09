; DESCRIPTION: Draws a white line from (233, 34) to (493, 244).
; PLAN: r0=233(x1), r1=34(y1), r2=493(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 34
LDI r2, 493
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
