; DESCRIPTION: Draws a blue line from (473, 200) to (294, 218).
; PLAN: r0=473(x1), r1=200(y1), r2=294(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 200
LDI r2, 294
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
