; DESCRIPTION: Draws a blue line from (463, 93) to (71, 36).
; PLAN: r0=463(x1), r1=93(y1), r2=71(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 93
LDI r2, 71
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
