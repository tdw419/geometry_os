; DESCRIPTION: Draws a red line from (256, 175) to (22, 55).
; PLAN: r0=256(x1), r1=175(y1), r2=22(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 175
LDI r2, 22
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
