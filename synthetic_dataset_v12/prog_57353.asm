; DESCRIPTION: Draws a blue line from (30, 245) to (446, 22).
; PLAN: r0=30(x1), r1=245(y1), r2=446(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 245
LDI r2, 446
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
