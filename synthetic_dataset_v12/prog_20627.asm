; DESCRIPTION: Renders a blue line between points (413, 79) and (387, 40).
; PLAN: r0=413(x1), r1=79(y1), r2=387(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 79
LDI r2, 387
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
