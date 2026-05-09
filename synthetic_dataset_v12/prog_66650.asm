; DESCRIPTION: Draws a yellow line from (304, 75) to (60, 139).
; PLAN: r0=304(x1), r1=75(y1), r2=60(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 75
LDI r2, 60
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
