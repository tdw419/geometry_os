; DESCRIPTION: Draws a green line from (35, 43) to (34, 6).
; PLAN: r0=35(x1), r1=43(y1), r2=34(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 43
LDI r2, 34
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
