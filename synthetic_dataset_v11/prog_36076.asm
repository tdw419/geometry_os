; DESCRIPTION: Renders a orange line between points (67, 19) and (226, 214).
; PLAN: r0=67(x1), r1=19(y1), r2=226(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 19
LDI r2, 226
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
