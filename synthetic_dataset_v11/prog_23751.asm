; DESCRIPTION: Places a red line segment connecting (198, 157) to (108, 16).
; PLAN: r0=198(x1), r1=157(y1), r2=108(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 157
LDI r2, 108
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
