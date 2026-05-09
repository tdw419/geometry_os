; DESCRIPTION: Places a magenta line segment connecting (62, 197) to (146, 40).
; PLAN: r0=62(x1), r1=197(y1), r2=146(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 197
LDI r2, 146
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
