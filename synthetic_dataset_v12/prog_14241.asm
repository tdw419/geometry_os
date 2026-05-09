; DESCRIPTION: Draws a blue line from (150, 67) to (216, 234).
; PLAN: r0=150(x1), r1=67(y1), r2=216(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 67
LDI r2, 216
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
