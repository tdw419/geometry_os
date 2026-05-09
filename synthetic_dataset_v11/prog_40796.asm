; DESCRIPTION: Places a green line segment connecting (81, 78) to (14, 59).
; PLAN: r0=81(x1), r1=78(y1), r2=14(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 78
LDI r2, 14
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
