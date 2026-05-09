; DESCRIPTION: Places a green line segment connecting (445, 174) to (486, 40).
; PLAN: r0=445(x1), r1=174(y1), r2=486(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 174
LDI r2, 486
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
