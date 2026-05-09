; DESCRIPTION: Places a red line segment connecting (460, 160) to (493, 191).
; PLAN: r0=460(x1), r1=160(y1), r2=493(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 160
LDI r2, 493
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
