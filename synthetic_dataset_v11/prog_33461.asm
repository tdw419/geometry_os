; DESCRIPTION: Places a white line segment connecting (112, 60) to (42, 42).
; PLAN: r0=112(x1), r1=60(y1), r2=42(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 60
LDI r2, 42
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
