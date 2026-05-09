; DESCRIPTION: Draws a white line from (399, 171) to (233, 180).
; PLAN: r0=399(x1), r1=171(y1), r2=233(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 171
LDI r2, 233
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
