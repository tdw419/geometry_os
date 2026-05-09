; DESCRIPTION: Draws a red line from (161, 192) to (165, 124).
; PLAN: r0=161(x1), r1=192(y1), r2=165(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 192
LDI r2, 165
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
