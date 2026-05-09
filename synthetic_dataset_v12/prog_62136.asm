; DESCRIPTION: Places a orange line segment connecting (502, 182) to (290, 194).
; PLAN: r0=502(x1), r1=182(y1), r2=290(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 182
LDI r2, 290
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
