; DESCRIPTION: Renders a blue line between points (59, 27) and (88, 5).
; PLAN: r0=59(x1), r1=27(y1), r2=88(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 27
LDI r2, 88
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
