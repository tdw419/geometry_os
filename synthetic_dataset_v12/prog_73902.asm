; DESCRIPTION: Draws a cyan line from (273, 110) to (2, 4).
; PLAN: r0=273(x1), r1=110(y1), r2=2(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 110
LDI r2, 2
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
