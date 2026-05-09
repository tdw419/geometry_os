; DESCRIPTION: Draws a blue line from (255, 27) to (25, 227).
; PLAN: r0=255(x1), r1=27(y1), r2=25(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 27
LDI r2, 25
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
