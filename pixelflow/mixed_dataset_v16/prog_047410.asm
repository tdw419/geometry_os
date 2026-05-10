; DESCRIPTION: Renders a orange line between points (38, 59) and (88, 210).
; PLAN: r0=38(x1), r1=59(y1), r2=88(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 59
LDI r2, 88
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
