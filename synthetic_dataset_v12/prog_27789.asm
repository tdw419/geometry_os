; DESCRIPTION: Renders a orange line between points (328, 223) and (95, 69).
; PLAN: r0=328(x1), r1=223(y1), r2=95(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 223
LDI r2, 95
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
