; DESCRIPTION: Draws a green line from (98, 55) to (153, 56).
; PLAN: r0=98(x1), r1=55(y1), r2=153(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 55
LDI r2, 153
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
