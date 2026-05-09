; DESCRIPTION: Draws a blue line from (126, 70) to (76, 245).
; PLAN: r0=126(x1), r1=70(y1), r2=76(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 70
LDI r2, 76
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
