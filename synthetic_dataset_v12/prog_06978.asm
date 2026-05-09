; DESCRIPTION: Places a red line segment connecting (80, 255) to (405, 48).
; PLAN: r0=80(x1), r1=255(y1), r2=405(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 255
LDI r2, 405
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
