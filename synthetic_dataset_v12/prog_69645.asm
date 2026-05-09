; DESCRIPTION: Places a green line segment connecting (130, 95) to (445, 96).
; PLAN: r0=130(x1), r1=95(y1), r2=445(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 95
LDI r2, 445
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
