; DESCRIPTION: Draws a blue line from (74, 180) to (224, 106).
; PLAN: r0=74(x1), r1=180(y1), r2=224(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 180
LDI r2, 224
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
