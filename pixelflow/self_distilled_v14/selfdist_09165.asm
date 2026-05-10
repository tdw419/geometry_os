; DESCRIPTION: Renders a orange line segment connecting (46, 69) to (242, 121).
; PLAN: r0=46(x1), r1=69(y1), r2=242(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 69
LDI r2, 242
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
