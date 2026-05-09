; DESCRIPTION: Places a green line segment connecting (313, 114) to (193, 150).
; PLAN: r0=313(x1), r1=114(y1), r2=193(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 114
LDI r2, 193
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
