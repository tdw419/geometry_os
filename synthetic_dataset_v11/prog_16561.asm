; DESCRIPTION: Renders a magenta line between points (135, 133) and (254, 184).
; PLAN: r0=135(x1), r1=133(y1), r2=254(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 133
LDI r2, 254
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
