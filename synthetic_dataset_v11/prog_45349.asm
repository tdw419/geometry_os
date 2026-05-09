; DESCRIPTION: Draws a red line from (185, 222) to (205, 74).
; PLAN: r0=185(x1), r1=222(y1), r2=205(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 222
LDI r2, 205
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
