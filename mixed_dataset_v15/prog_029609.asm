; DESCRIPTION: Draws a red line from (204, 208) to (82, 193).
; PLAN: r0=204(x1), r1=208(y1), r2=82(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 208
LDI r2, 82
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
