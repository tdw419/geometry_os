; DESCRIPTION: Places a red line segment connecting (63, 127) to (108, 183).
; PLAN: r0=63(x1), r1=127(y1), r2=108(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 127
LDI r2, 108
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
