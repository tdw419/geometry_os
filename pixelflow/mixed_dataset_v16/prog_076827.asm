; DESCRIPTION: Draws a blue line from (306, 156) to (489, 242).
; PLAN: r0=306(x1), r1=156(y1), r2=489(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 156
LDI r2, 489
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
