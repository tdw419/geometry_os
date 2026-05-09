; DESCRIPTION: Places a orange line segment connecting (138, 42) to (105, 117).
; PLAN: r0=138(x1), r1=42(y1), r2=105(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 42
LDI r2, 105
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
