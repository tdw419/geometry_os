; DESCRIPTION: Draws a yellow line from (149, 98) to (356, 127).
; PLAN: r0=149(x1), r1=98(y1), r2=356(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 98
LDI r2, 356
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
