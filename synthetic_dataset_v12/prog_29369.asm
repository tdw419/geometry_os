; DESCRIPTION: Places a red line segment connecting (255, 108) to (416, 123).
; PLAN: r0=255(x1), r1=108(y1), r2=416(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 108
LDI r2, 416
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
