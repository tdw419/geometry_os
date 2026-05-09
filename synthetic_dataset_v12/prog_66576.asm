; DESCRIPTION: Draws a green line from (341, 162) to (192, 214).
; PLAN: r0=341(x1), r1=162(y1), r2=192(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 162
LDI r2, 192
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
