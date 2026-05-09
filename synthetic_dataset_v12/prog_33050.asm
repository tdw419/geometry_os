; DESCRIPTION: Places a green line segment connecting (348, 241) to (108, 91).
; PLAN: r0=348(x1), r1=241(y1), r2=108(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 241
LDI r2, 108
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
