; DESCRIPTION: Renders a orange line between points (89, 243) and (27, 210).
; PLAN: r0=89(x1), r1=243(y1), r2=27(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 243
LDI r2, 27
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
