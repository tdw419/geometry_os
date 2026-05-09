; DESCRIPTION: Draws a green line from (272, 117) to (472, 89).
; PLAN: r0=272(x1), r1=117(y1), r2=472(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 117
LDI r2, 472
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
