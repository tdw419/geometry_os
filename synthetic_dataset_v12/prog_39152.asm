; DESCRIPTION: Places a green line segment connecting (196, 55) to (453, 41).
; PLAN: r0=196(x1), r1=55(y1), r2=453(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 55
LDI r2, 453
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
