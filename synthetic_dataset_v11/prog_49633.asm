; DESCRIPTION: Draws a blue line from (12, 93) to (182, 34).
; PLAN: r0=12(x1), r1=93(y1), r2=182(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 93
LDI r2, 182
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
