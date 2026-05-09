; DESCRIPTION: Places a red line segment connecting (59, 160) to (254, 206).
; PLAN: r0=59(x1), r1=160(y1), r2=254(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 160
LDI r2, 254
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
