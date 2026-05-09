; DESCRIPTION: Renders a orange line between points (229, 249) and (241, 64).
; PLAN: r0=229(x1), r1=249(y1), r2=241(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 249
LDI r2, 241
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
