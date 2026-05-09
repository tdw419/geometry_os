; DESCRIPTION: Draws a red line from (254, 135) to (198, 211).
; PLAN: r0=254(x1), r1=135(y1), r2=198(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 135
LDI r2, 198
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
