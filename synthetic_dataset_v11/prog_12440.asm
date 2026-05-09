; DESCRIPTION: Draws a blue line from (120, 57) to (146, 158).
; PLAN: r0=120(x1), r1=57(y1), r2=146(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 57
LDI r2, 146
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
