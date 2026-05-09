; DESCRIPTION: Draws a red line from (124, 2) to (225, 24).
; PLAN: r0=124(x1), r1=2(y1), r2=225(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 2
LDI r2, 225
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
