; DESCRIPTION: Renders a magenta line between points (470, 72) and (225, 219).
; PLAN: r0=470(x1), r1=72(y1), r2=225(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 72
LDI r2, 225
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
