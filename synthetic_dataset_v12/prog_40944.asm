; DESCRIPTION: Draws a red line from (282, 20) to (485, 211).
; PLAN: r0=282(x1), r1=20(y1), r2=485(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 20
LDI r2, 485
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
