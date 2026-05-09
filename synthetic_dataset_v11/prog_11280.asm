; DESCRIPTION: Draws a yellow line from (90, 57) to (81, 92).
; PLAN: r0=90(x1), r1=57(y1), r2=81(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 57
LDI r2, 81
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
