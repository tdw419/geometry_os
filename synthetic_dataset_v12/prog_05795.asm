; DESCRIPTION: Draws a yellow line from (110, 55) to (400, 171).
; PLAN: r0=110(x1), r1=55(y1), r2=400(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 55
LDI r2, 400
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
