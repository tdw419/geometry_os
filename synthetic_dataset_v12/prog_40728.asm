; DESCRIPTION: Draws a red line from (371, 134) to (138, 7).
; PLAN: r0=371(x1), r1=134(y1), r2=138(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 134
LDI r2, 138
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
