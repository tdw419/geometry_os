; DESCRIPTION: Draws a white line from (198, 113) to (339, 33).
; PLAN: r0=198(x1), r1=113(y1), r2=339(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 113
LDI r2, 339
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
