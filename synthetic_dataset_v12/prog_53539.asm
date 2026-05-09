; DESCRIPTION: Renders a magenta line between points (387, 250) and (120, 19).
; PLAN: r0=387(x1), r1=250(y1), r2=120(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 250
LDI r2, 120
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
