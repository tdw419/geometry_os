; DESCRIPTION: Places a yellow line segment connecting (86, 168) to (38, 70).
; PLAN: r0=86(x1), r1=168(y1), r2=38(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 168
LDI r2, 38
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
