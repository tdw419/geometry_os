; DESCRIPTION: Places a green line segment connecting (212, 188) to (111, 146).
; PLAN: r0=212(x1), r1=188(y1), r2=111(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 188
LDI r2, 111
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
