; DESCRIPTION: Draws a purple line from (108, 156) to (168, 108).
; PLAN: r0=108(x1), r1=156(y1), r2=168(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 156
LDI r2, 168
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
