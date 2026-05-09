; DESCRIPTION: Places a green line segment connecting (460, 85) to (365, 2).
; PLAN: r0=460(x1), r1=85(y1), r2=365(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 85
LDI r2, 365
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
