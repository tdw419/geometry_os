; DESCRIPTION: Draws a red line from (104, 202) to (204, 70).
; PLAN: r0=104(x1), r1=202(y1), r2=204(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 202
LDI r2, 204
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
