; DESCRIPTION: Draws a blue line from (184, 109) to (365, 80).
; PLAN: r0=184(x1), r1=109(y1), r2=365(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 109
LDI r2, 365
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
