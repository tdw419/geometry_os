; DESCRIPTION: Renders a magenta line between points (387, 193) and (46, 191).
; PLAN: r0=387(x1), r1=193(y1), r2=46(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 193
LDI r2, 46
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
