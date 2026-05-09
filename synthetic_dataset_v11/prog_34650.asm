; DESCRIPTION: Draws a green line from (252, 221) to (194, 94).
; PLAN: r0=252(x1), r1=221(y1), r2=194(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 221
LDI r2, 194
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
