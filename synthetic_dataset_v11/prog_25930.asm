; DESCRIPTION: Places a orange line segment connecting (59, 90) to (27, 29).
; PLAN: r0=59(x1), r1=90(y1), r2=27(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 90
LDI r2, 27
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
