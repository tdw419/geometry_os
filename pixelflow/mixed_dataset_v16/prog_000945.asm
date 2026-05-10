; DESCRIPTION: Renders a magenta line between points (436, 171) and (27, 133).
; PLAN: r0=436(x1), r1=171(y1), r2=27(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 171
LDI r2, 27
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
