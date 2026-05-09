; DESCRIPTION: Draws a red line from (96, 243) to (210, 47).
; PLAN: r0=96(x1), r1=243(y1), r2=210(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 243
LDI r2, 210
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
