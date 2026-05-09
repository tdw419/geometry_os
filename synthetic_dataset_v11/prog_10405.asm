; DESCRIPTION: Draws a red line from (223, 62) to (255, 77).
; PLAN: r0=223(x1), r1=62(y1), r2=255(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 62
LDI r2, 255
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
