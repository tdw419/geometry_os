; DESCRIPTION: Places a green line segment connecting (181, 164) to (178, 33).
; PLAN: r0=181(x1), r1=164(y1), r2=178(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 164
LDI r2, 178
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
