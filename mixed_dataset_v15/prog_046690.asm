; DESCRIPTION: Draws a red line from (86, 69) to (98, 90).
; PLAN: r0=86(x1), r1=69(y1), r2=98(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 69
LDI r2, 98
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
