; DESCRIPTION: Draws a white line from (372, 184) to (112, 180).
; PLAN: r0=372(x1), r1=184(y1), r2=112(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 184
LDI r2, 112
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
