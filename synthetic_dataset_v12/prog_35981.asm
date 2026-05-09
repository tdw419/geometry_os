; DESCRIPTION: Renders a blue line between points (464, 205) and (485, 145).
; PLAN: r0=464(x1), r1=205(y1), r2=485(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 205
LDI r2, 485
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
