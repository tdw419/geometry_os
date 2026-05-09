; DESCRIPTION: Draws a blue line from (348, 21) to (69, 91).
; PLAN: r0=348(x1), r1=21(y1), r2=69(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 21
LDI r2, 69
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
