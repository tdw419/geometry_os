; DESCRIPTION: Draws a green line from (291, 78) to (503, 212).
; PLAN: r0=291(x1), r1=78(y1), r2=503(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 78
LDI r2, 503
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
