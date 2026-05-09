; DESCRIPTION: Places a magenta line segment connecting (346, 158) to (233, 128).
; PLAN: r0=346(x1), r1=158(y1), r2=233(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 158
LDI r2, 233
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
