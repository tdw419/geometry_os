; DESCRIPTION: Draws a red line from (221, 208) to (16, 39).
; PLAN: r0=221(x1), r1=208(y1), r2=16(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 208
LDI r2, 16
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
