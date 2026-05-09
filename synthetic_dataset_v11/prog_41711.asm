; DESCRIPTION: Places a green line segment connecting (187, 38) to (95, 11).
; PLAN: r0=187(x1), r1=38(y1), r2=95(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 38
LDI r2, 95
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
