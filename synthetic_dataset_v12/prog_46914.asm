; DESCRIPTION: Draws a white line from (400, 233) to (395, 33).
; PLAN: r0=400(x1), r1=233(y1), r2=395(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 233
LDI r2, 395
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
