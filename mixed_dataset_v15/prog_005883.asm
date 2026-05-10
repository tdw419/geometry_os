; DESCRIPTION: Draws a white line from (400, 135) to (226, 4).
; PLAN: r0=400(x1), r1=135(y1), r2=226(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 135
LDI r2, 226
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
