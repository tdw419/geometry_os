; DESCRIPTION: Places a orange line segment connecting (307, 53) to (112, 42).
; PLAN: r0=307(x1), r1=53(y1), r2=112(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 53
LDI r2, 112
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
