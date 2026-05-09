; DESCRIPTION: Places a orange line segment connecting (59, 74) to (435, 91).
; PLAN: r0=59(x1), r1=74(y1), r2=435(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 74
LDI r2, 435
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
