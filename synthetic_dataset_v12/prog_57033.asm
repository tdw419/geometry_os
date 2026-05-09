; DESCRIPTION: Renders a orange line between points (213, 168) and (363, 155).
; PLAN: r0=213(x1), r1=168(y1), r2=363(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 168
LDI r2, 363
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
