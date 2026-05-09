; DESCRIPTION: Draws a yellow line from (81, 117) to (244, 48).
; PLAN: r0=81(x1), r1=117(y1), r2=244(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 117
LDI r2, 244
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
