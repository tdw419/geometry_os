; DESCRIPTION: Draws a green line from (327, 106) to (43, 35).
; PLAN: r0=327(x1), r1=106(y1), r2=43(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 106
LDI r2, 43
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
