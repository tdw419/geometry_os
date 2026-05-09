; DESCRIPTION: Renders a magenta line between points (57, 145) and (27, 244).
; PLAN: r0=57(x1), r1=145(y1), r2=27(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 145
LDI r2, 27
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
