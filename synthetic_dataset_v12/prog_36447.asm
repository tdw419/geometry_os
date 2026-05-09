; DESCRIPTION: Places a purple line segment connecting (42, 71) to (335, 32).
; PLAN: r0=42(x1), r1=71(y1), r2=335(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 71
LDI r2, 335
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
