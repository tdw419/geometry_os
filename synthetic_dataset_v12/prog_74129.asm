; DESCRIPTION: Draws a green line from (25, 43) to (39, 54).
; PLAN: r0=25(x1), r1=43(y1), r2=39(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 43
LDI r2, 39
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
