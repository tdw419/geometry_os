; DESCRIPTION: Renders a orange line between points (46, 126) and (196, 133).
; PLAN: r0=46(x1), r1=126(y1), r2=196(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 126
LDI r2, 196
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
