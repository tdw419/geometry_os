; DESCRIPTION: Renders a orange line between points (373, 236) and (485, 202).
; PLAN: r0=373(x1), r1=236(y1), r2=485(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 236
LDI r2, 485
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
