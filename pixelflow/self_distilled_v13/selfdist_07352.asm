; DESCRIPTION: Renders a orange line segment connecting (233, 129) to (288, 107).
; PLAN: r0=233(x1), r1=129(y1), r2=288(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 129
LDI r2, 288
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
