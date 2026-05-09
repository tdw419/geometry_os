; DESCRIPTION: Draws a cyan line from (68, 137) to (17, 110).
; PLAN: r0=68(x1), r1=137(y1), r2=17(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 137
LDI r2, 17
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
