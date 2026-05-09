; DESCRIPTION: Draws a blue line from (34, 46) to (68, 108).
; PLAN: r0=34(x1), r1=46(y1), r2=68(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 46
LDI r2, 68
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
