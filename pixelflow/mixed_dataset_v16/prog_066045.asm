; DESCRIPTION: Renders a magenta line between points (254, 171) and (161, 243).
; PLAN: r0=254(x1), r1=171(y1), r2=161(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 171
LDI r2, 161
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
