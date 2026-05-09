; DESCRIPTION: Places a red line segment connecting (72, 151) to (255, 218).
; PLAN: r0=72(x1), r1=151(y1), r2=255(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 151
LDI r2, 255
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
