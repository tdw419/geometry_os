; DESCRIPTION: Draws a green line from (54, 105) to (68, 43).
; PLAN: r0=54(x1), r1=105(y1), r2=68(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 105
LDI r2, 68
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
