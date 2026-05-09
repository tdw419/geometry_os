; DESCRIPTION: Draws a red line from (192, 95) to (197, 31).
; PLAN: r0=192(x1), r1=95(y1), r2=197(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 95
LDI r2, 197
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
