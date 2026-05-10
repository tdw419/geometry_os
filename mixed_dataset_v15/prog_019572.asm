; DESCRIPTION: Draws a blue line from (107, 175) to (120, 74).
; PLAN: r0=107(x1), r1=175(y1), r2=120(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 175
LDI r2, 120
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
