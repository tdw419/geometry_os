; DESCRIPTION: Draws a red line from (416, 102) to (256, 6).
; PLAN: r0=416(x1), r1=102(y1), r2=256(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 102
LDI r2, 256
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
