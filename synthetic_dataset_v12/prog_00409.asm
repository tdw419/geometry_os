; DESCRIPTION: Places a green line segment connecting (493, 78) to (445, 40).
; PLAN: r0=493(x1), r1=78(y1), r2=445(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 78
LDI r2, 445
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
