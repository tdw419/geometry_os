; DESCRIPTION: Renders a blue line between points (327, 59) and (218, 76).
; PLAN: r0=327(x1), r1=59(y1), r2=218(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 59
LDI r2, 218
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
