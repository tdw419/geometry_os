; DESCRIPTION: Draws a red line from (71, 2) to (76, 204).
; PLAN: r0=71(x1), r1=2(y1), r2=76(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 2
LDI r2, 76
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
