; DESCRIPTION: Draws a green line from (86, 84) to (233, 43).
; PLAN: r0=86(x1), r1=84(y1), r2=233(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 84
LDI r2, 233
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
