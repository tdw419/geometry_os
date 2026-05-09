; DESCRIPTION: Draws a green line from (82, 100) to (192, 137).
; PLAN: r0=82(x1), r1=100(y1), r2=192(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 100
LDI r2, 192
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
