; DESCRIPTION: Draws a green line from (30, 198) to (138, 21).
; PLAN: r0=30(x1), r1=198(y1), r2=138(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 198
LDI r2, 138
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
