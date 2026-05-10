; DESCRIPTION: Renders a orange line between points (196, 229) and (446, 40).
; PLAN: r0=196(x1), r1=229(y1), r2=446(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 229
LDI r2, 446
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
