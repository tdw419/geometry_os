; DESCRIPTION: Draws a red line from (25, 64) to (11, 209).
; PLAN: r0=25(x1), r1=64(y1), r2=11(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 64
LDI r2, 11
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
