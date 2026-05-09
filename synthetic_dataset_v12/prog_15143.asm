; DESCRIPTION: Places a magenta line segment connecting (384, 74) to (10, 176).
; PLAN: r0=384(x1), r1=74(y1), r2=10(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 74
LDI r2, 10
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
