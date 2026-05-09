; DESCRIPTION: Draws a blue line from (65, 29) to (76, 71).
; PLAN: r0=65(x1), r1=29(y1), r2=76(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 29
LDI r2, 76
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
