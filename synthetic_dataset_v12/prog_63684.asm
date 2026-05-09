; DESCRIPTION: Places a black line segment connecting (50, 130) to (222, 41).
; PLAN: r0=50(x1), r1=130(y1), r2=222(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 130
LDI r2, 222
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
