; DESCRIPTION: Draws a red line from (20, 58) to (241, 83).
; PLAN: r0=20(x1), r1=58(y1), r2=241(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 58
LDI r2, 241
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
