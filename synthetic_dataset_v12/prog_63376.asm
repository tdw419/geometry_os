; DESCRIPTION: Places a white line segment connecting (493, 59) to (88, 246).
; PLAN: r0=493(x1), r1=59(y1), r2=88(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 59
LDI r2, 88
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
