; DESCRIPTION: Draws a red line from (258, 29) to (233, 33).
; PLAN: r0=258(x1), r1=29(y1), r2=233(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 29
LDI r2, 233
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
