; DESCRIPTION: Renders a magenta line between points (55, 178) and (218, 8).
; PLAN: r0=55(x1), r1=178(y1), r2=218(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 178
LDI r2, 218
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
