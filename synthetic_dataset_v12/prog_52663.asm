; DESCRIPTION: Draws a white line from (485, 137) to (80, 180).
; PLAN: r0=485(x1), r1=137(y1), r2=80(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 137
LDI r2, 80
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
