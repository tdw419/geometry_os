; DESCRIPTION: Places a green line segment connecting (48, 25) to (302, 202).
; PLAN: r0=48(x1), r1=25(y1), r2=302(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 25
LDI r2, 302
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
