; DESCRIPTION: Renders a magenta line between points (434, 141) and (419, 244).
; PLAN: r0=434(x1), r1=141(y1), r2=419(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 141
LDI r2, 419
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
