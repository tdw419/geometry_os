; DESCRIPTION: Draws a green line from (192, 120) to (211, 18).
; PLAN: r0=192(x1), r1=120(y1), r2=211(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 120
LDI r2, 211
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
