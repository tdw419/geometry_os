; DESCRIPTION: Places a yellow line segment connecting (198, 116) to (265, 216).
; PLAN: r0=198(x1), r1=116(y1), r2=265(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 116
LDI r2, 265
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
