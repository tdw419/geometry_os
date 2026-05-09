; DESCRIPTION: Renders a blue line between points (320, 57) and (59, 88).
; PLAN: r0=320(x1), r1=57(y1), r2=59(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 57
LDI r2, 59
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
