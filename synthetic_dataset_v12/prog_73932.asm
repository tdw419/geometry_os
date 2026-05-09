; DESCRIPTION: Draws a green line from (38, 251) to (209, 105).
; PLAN: r0=38(x1), r1=251(y1), r2=209(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 251
LDI r2, 209
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
