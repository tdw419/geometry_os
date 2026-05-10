; DESCRIPTION: Renders a orange line segment connecting (167, 126) to (206, 53).
; PLAN: r0=167(x1), r1=126(y1), r2=206(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 126
LDI r2, 206
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
