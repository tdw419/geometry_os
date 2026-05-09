; DESCRIPTION: Places a yellow line segment connecting (193, 225) to (59, 141).
; PLAN: r0=193(x1), r1=225(y1), r2=59(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 225
LDI r2, 59
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
