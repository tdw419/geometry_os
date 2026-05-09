; DESCRIPTION: Places a magenta line segment connecting (141, 96) to (259, 42).
; PLAN: r0=141(x1), r1=96(y1), r2=259(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 96
LDI r2, 259
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
