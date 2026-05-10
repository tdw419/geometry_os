; DESCRIPTION: Renders a orange line segment connecting (75, 187) to (58, 195).
; PLAN: r0=75(x1), r1=187(y1), r2=58(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 187
LDI r2, 58
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
