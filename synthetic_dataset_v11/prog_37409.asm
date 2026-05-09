; DESCRIPTION: Places a yellow line segment connecting (102, 74) to (42, 152).
; PLAN: r0=102(x1), r1=74(y1), r2=42(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 74
LDI r2, 42
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
