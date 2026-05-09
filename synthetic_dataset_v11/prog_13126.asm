; DESCRIPTION: Renders a orange line between points (237, 214) and (54, 82).
; PLAN: r0=237(x1), r1=214(y1), r2=54(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 214
LDI r2, 54
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
