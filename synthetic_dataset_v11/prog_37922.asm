; DESCRIPTION: Places a orange line segment connecting (187, 150) to (154, 112).
; PLAN: r0=187(x1), r1=150(y1), r2=154(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 150
LDI r2, 154
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
