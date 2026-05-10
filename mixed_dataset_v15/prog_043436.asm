; DESCRIPTION: Draws a red line from (270, 18) to (112, 16).
; PLAN: r0=270(x1), r1=18(y1), r2=112(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 18
LDI r2, 112
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
