; DESCRIPTION: Places a green line segment connecting (303, 163) to (359, 134).
; PLAN: r0=303(x1), r1=163(y1), r2=359(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 163
LDI r2, 359
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
