; DESCRIPTION: Places a magenta line segment connecting (439, 73) to (416, 87).
; PLAN: r0=439(x1), r1=73(y1), r2=416(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 73
LDI r2, 416
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
