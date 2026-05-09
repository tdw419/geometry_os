; DESCRIPTION: Draws a blue line from (68, 236) to (182, 23).
; PLAN: r0=68(x1), r1=236(y1), r2=182(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 236
LDI r2, 182
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
