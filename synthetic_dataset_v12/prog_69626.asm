; DESCRIPTION: Draws a yellow line from (246, 207) to (360, 92).
; PLAN: r0=246(x1), r1=207(y1), r2=360(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 207
LDI r2, 360
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
