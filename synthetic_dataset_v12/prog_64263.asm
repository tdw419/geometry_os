; DESCRIPTION: Places a green line segment connecting (99, 146) to (360, 108).
; PLAN: r0=99(x1), r1=146(y1), r2=360(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 146
LDI r2, 360
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
