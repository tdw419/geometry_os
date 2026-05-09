; DESCRIPTION: Renders a orange line between points (221, 208) and (214, 87).
; PLAN: r0=221(x1), r1=208(y1), r2=214(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 208
LDI r2, 214
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
