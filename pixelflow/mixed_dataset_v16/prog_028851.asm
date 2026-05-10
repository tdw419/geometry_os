; DESCRIPTION: Draws a red line from (81, 219) to (86, 209).
; PLAN: r0=81(x1), r1=219(y1), r2=86(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 219
LDI r2, 86
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
