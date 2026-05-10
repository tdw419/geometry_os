; DESCRIPTION: Draws a magenta line from (189, 242) to (359, 25).
; PLAN: r0=189(x1), r1=242(y1), r2=359(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 242
LDI r2, 359
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
