; DESCRIPTION: Places a orange line segment connecting (363, 136) to (214, 215).
; PLAN: r0=363(x1), r1=136(y1), r2=214(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 136
LDI r2, 214
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
