; DESCRIPTION: Places a green line segment connecting (385, 166) to (13, 19).
; PLAN: r0=385(x1), r1=166(y1), r2=13(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 166
LDI r2, 13
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
