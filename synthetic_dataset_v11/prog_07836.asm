; DESCRIPTION: Draws a blue line from (182, 255) to (59, 72).
; PLAN: r0=182(x1), r1=255(y1), r2=59(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 255
LDI r2, 59
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
