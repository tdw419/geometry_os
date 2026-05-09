; DESCRIPTION: Draws a blue line from (59, 108) to (61, 64).
; PLAN: r0=59(x1), r1=108(y1), r2=61(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 108
LDI r2, 61
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
