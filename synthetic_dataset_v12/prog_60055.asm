; DESCRIPTION: Places a blue line segment connecting (166, 194) to (197, 63).
; PLAN: r0=166(x1), r1=194(y1), r2=197(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 194
LDI r2, 197
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
