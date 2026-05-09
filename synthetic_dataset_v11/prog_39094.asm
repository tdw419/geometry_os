; DESCRIPTION: Draws a green line from (202, 55) to (200, 203).
; PLAN: r0=202(x1), r1=55(y1), r2=200(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 55
LDI r2, 200
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
