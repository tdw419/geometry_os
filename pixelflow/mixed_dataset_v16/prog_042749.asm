; DESCRIPTION: Places a orange line segment connecting (196, 21) to (306, 204).
; PLAN: r0=196(x1), r1=21(y1), r2=306(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 21
LDI r2, 306
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
