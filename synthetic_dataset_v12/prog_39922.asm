; DESCRIPTION: Renders a purple line between points (256, 244) and (223, 146).
; PLAN: r0=256(x1), r1=244(y1), r2=223(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 244
LDI r2, 223
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
