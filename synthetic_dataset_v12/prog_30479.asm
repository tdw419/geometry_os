; DESCRIPTION: Places a purple line segment connecting (433, 228) to (194, 28).
; PLAN: r0=433(x1), r1=228(y1), r2=194(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 228
LDI r2, 194
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
