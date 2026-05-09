; DESCRIPTION: Draws a red line from (34, 209) to (120, 209).
; PLAN: r0=34(x1), r1=209(y1), r2=120(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 209
LDI r2, 120
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
