; DESCRIPTION: Draws a cyan line from (89, 145) to (310, 176).
; PLAN: r0=89(x1), r1=145(y1), r2=310(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 145
LDI r2, 310
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
