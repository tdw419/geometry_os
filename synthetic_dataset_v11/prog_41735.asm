; DESCRIPTION: Draws a red line from (200, 102) to (197, 192).
; PLAN: r0=200(x1), r1=102(y1), r2=197(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 102
LDI r2, 197
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
