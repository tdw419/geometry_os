; DESCRIPTION: Renders a magenta line between points (143, 122) and (196, 244).
; PLAN: r0=143(x1), r1=122(y1), r2=196(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 122
LDI r2, 196
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
