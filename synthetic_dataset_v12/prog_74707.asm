; DESCRIPTION: Draws a blue line from (415, 59) to (388, 69).
; PLAN: r0=415(x1), r1=59(y1), r2=388(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 59
LDI r2, 388
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
