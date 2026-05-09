; DESCRIPTION: Draws a yellow line from (108, 120) to (91, 212).
; PLAN: r0=108(x1), r1=120(y1), r2=91(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 120
LDI r2, 91
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
