; DESCRIPTION: Draws a blue line from (473, 53) to (263, 34).
; PLAN: r0=473(x1), r1=53(y1), r2=263(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 53
LDI r2, 263
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
