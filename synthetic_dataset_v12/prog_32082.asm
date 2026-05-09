; DESCRIPTION: Renders a blue line between points (180, 87) and (205, 252).
; PLAN: r0=180(x1), r1=87(y1), r2=205(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 87
LDI r2, 205
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
