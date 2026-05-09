; DESCRIPTION: Places a orange line segment connecting (154, 165) to (466, 187).
; PLAN: r0=154(x1), r1=165(y1), r2=466(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 165
LDI r2, 466
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
