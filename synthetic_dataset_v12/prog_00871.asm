; DESCRIPTION: Places a red line segment connecting (178, 255) to (77, 95).
; PLAN: r0=178(x1), r1=255(y1), r2=77(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 255
LDI r2, 77
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
