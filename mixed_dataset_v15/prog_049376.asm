; DESCRIPTION: Places a yellow line segment connecting (262, 26) to (313, 223).
; PLAN: r0=262(x1), r1=26(y1), r2=313(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 26
LDI r2, 313
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
