; DESCRIPTION: Renders a blue line between points (183, 85) and (146, 220).
; PLAN: r0=183(x1), r1=85(y1), r2=146(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 85
LDI r2, 146
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
