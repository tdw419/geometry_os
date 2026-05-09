; DESCRIPTION: Places a red line segment connecting (108, 199) to (123, 255).
; PLAN: r0=108(x1), r1=199(y1), r2=123(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 199
LDI r2, 123
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
