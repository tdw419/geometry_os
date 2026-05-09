; DESCRIPTION: Draws a green line from (17, 31) to (75, 254).
; PLAN: r0=17(x1), r1=31(y1), r2=75(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 31
LDI r2, 75
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
