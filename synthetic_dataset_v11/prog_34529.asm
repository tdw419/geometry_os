; DESCRIPTION: Draws a red line from (142, 205) to (86, 90).
; PLAN: r0=142(x1), r1=205(y1), r2=86(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 205
LDI r2, 86
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
