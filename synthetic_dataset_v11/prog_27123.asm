; DESCRIPTION: Places a yellow line segment connecting (102, 42) to (18, 123).
; PLAN: r0=102(x1), r1=42(y1), r2=18(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 42
LDI r2, 18
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
