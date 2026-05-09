; DESCRIPTION: Draws a cyan line from (17, 119) to (0, 89).
; PLAN: r0=17(x1), r1=119(y1), r2=0(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 119
LDI r2, 0
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
