; DESCRIPTION: Renders a magenta line between points (18, 244) and (226, 197).
; PLAN: r0=18(x1), r1=244(y1), r2=226(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 244
LDI r2, 226
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
