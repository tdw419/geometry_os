; DESCRIPTION: Places a red line segment connecting (81, 16) to (254, 243).
; PLAN: r0=81(x1), r1=16(y1), r2=254(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 16
LDI r2, 254
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
